#!/bin/sh
# https://www.reddit.com/r/swaywm/comments/kmopbo/comment/hxlbb2q/?context=3

# Subscribe to all sway window change events that match new, move, floating, or close
swaymsg -t subscribe -m '["window"]' |
  jq -c -r --unbuffered 'select(.change | IN("new", "move", "floating", "close"))' |
  while IFS= read -r _ ; do
  # Every time we read a line from the previous command update the text and
  # tooltip of our indicator, outputting something empty if there are no
  # windows in the scratchpad
  swaymsg -t get_tree |
    jq --unbuffered --compact-output '
      (
        recurse(.nodes[])
        | select(.name == "__i3_scratch")
        | .focus
      ) as $scratch_ids
      | [
        ..
        | (.nodes? + .floating_nodes?) // empty
        | .[]
        | select(.id|IN($scratch_ids[])) ] as $scratch_nodes
        | if ($scratch_nodes|length) > 0 then
          {
            text: $scratch_nodes | length | tostring,
            tooltip:
              $scratch_nodes
              | map("\(.app_id // .window_properties.class) \(.id): \(.name)")
              | join ("\n")
          }
          else empty end
      '
done

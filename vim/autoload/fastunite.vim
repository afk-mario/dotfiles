function! fastunite#loaded()
  let g:unite_prompt = '▸ '
  call unite#custom#profile('default', 'context', extend({
    \ 'direction' : 'topleft',
    \ 'prompt' : ' x'
    \ }, g:fastunite_default_options))
    echo "DONE function was called D: "
endfunction


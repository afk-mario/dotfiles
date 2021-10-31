# ##### BEGIN GPL LICENSE BLOCK #####
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either version 2
#  of the License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software Foundation,
#  Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
#
# ##### END GPL LICENSE BLOCK #####
# <pep8 compliant>

bl_info = {
    "name": "Export multiple OBJ files",
    "author": "p2or, brockmann, trippeljojo",
    "version": (0, 2, 0),
    "blender": (2, 80, 0),
    "location": "File > Import-Export",
    "description": "Export multiple OBJ files, UV's, materials",
    "warning": "",
    "wiki_url": "",
    "tracker_url": "",
    "category": "Import-Export",
}


import bpy
import os

from bpy_extras.io_utils import ExportHelper

from bpy.props import (
    BoolProperty,
    FloatProperty,
    StringProperty,
    EnumProperty,
    CollectionProperty,
)


class ExportMultipleObjs(bpy.types.Operator, ExportHelper):
    """Batch export objects as obj files"""

    bl_idname = "export_scene.batch_obj"
    bl_label = "Batch export OBJ's"
    bl_options = {"PRESET", "UNDO"}

    # ExportHelper mixin class uses this
    filename_ext = ".obj"

    filter_glob = StringProperty(
        default="*.obj;*.mtl",
        options={"HIDDEN"},
    )

    # List of operator properties, the attributes will be assigned
    # to the class instance from the operator setting before calling.

    # context group
    use_selection_setting: BoolProperty(
        name="Selection Only",
        description="Export selected objects only",
        default=True,
    )
    use_animation_setting: BoolProperty(
        name="Animation",
        description="Write out an OBJ for each frame",
        default=False,
    )

    # object group
    use_mesh_modifiers_setting: BoolProperty(
        name="Apply Modifiers",
        description="Apply modifiers (preview resolution)",
        default=True,
    )

    # extra data group
    use_edges_setting: BoolProperty(
        name="Include Edges",
        description="",
        default=True,
    )
    use_smooth_groups_setting: BoolProperty(
        name="Smooth Groups",
        description="Write sharp edges as smooth groups",
        default=False,
    )
    use_smooth_groups_bitflags_setting: BoolProperty(
        name="Bitflag Smooth Groups",
        description="Same as 'Smooth Groups', but generate smooth groups IDs as bitflags "
        "(produces at most 32 different smooth groups, usually much less)",
        default=False,
    )
    use_normals_setting: BoolProperty(
        name="Write Normals",
        description="Export one normal per vertex and per face, to represent flat faces and sharp edges",
        default=False,
    )
    use_uvs_setting: BoolProperty(
        name="Include UVs",
        description="Write out the active UV coordinates",
        default=True,
    )
    use_materials_setting: BoolProperty(
        name="Write Materials",
        description="Write out the MTL file",
        default=True,
    )
    use_triangles_setting: BoolProperty(
        name="Triangulate Faces",
        description="Convert all faces to triangles",
        default=False,
    )
    use_nurbs_setting: BoolProperty(
        name="Write Nurbs",
        description="Write nurbs curves as OBJ nurbs rather than "
        "converting to geometry",
        default=False,
    )
    use_vertex_groups_setting: BoolProperty(
        name="Polygroups",
        description="",
        default=False,
    )

    use_blen_objects_setting: BoolProperty(
        name="Objects as OBJ Objects",
        description="",
        default=True,
    )
    group_by_object_setting: BoolProperty(
        name="Objects as OBJ Groups ",
        description="",
        default=False,
    )
    group_by_material_setting: BoolProperty(
        name="Material Groups",
        description="",
        default=False,
    )
    keep_vertex_order_setting: BoolProperty(
        name="Keep Vertex Order",
        description="",
        default=False,
    )
    axis_forward_setting: EnumProperty(
        name="Forward",
        items=(
            ("X", "X Forward", ""),
            ("Y", "Y Forward", ""),
            ("Z", "Z Forward", ""),
            ("-X", "-X Forward", ""),
            ("-Y", "-Y Forward", ""),
            ("-Z", "-Z Forward", ""),
        ),
        default="-Z",
    )
    axis_up_setting: EnumProperty(
        name="Up",
        items=(
            ("X", "X Up", ""),
            ("Y", "Y Up", ""),
            ("Z", "Z Up", ""),
            ("-X", "-X Up", ""),
            ("-Y", "-Y Up", ""),
            ("-Z", "-Z Up", ""),
        ),
        default="Y",
    )
    global_scale_setting: FloatProperty(
        name="Scale",
        min=0.01,
        max=1000.0,
        default=1.0,
    )
    path_mode_setting: EnumProperty(
        name="Path Mode",
        items=(
            ("AUTO", "Auto", ""),
            ("ABSOLUTE", "Absolute", ""),
            ("RELATIVE", "Relative", ""),
            ("MATCH", "Match", ""),
            ("STRIP", "Strip", ""),
            ("COPY", "Copy", ""),
        ),
        default="AUTO",
    )

    def execute(self, context):

        # get the folder
        folder_path = os.path.dirname(self.filepath)

        # get objects selected in the viewport
        viewport_selection = context.selected_objects

        # get export objects
        obj_export_list = viewport_selection
        if self.use_selection_setting == False:
            obj_export_list = [i for i in context.scene.objects]

        # deselect all objects
        bpy.ops.object.select_all(action="DESELECT")

        for item in obj_export_list:
            item.select_set(True)
            if item.type == "MESH":
                file_path = os.path.join(folder_path, "{}.obj".format(item.name))

                bpy.ops.export_scene.obj(
                    filepath=file_path,
                    use_selection=self.use_selection_setting,
                    axis_forward=self.axis_forward_setting,
                    axis_up=self.axis_up_setting,
                    use_animation=self.use_animation_setting,
                    use_mesh_modifiers=self.use_mesh_modifiers_setting,
                    use_edges=self.use_edges_setting,
                    use_smooth_groups=self.use_smooth_groups_setting,
                    use_smooth_groups_bitflags=self.use_smooth_groups_bitflags_setting,
                    use_normals=self.use_normals_setting,
                    use_uvs=self.use_uvs_setting,
                    use_materials=self.use_materials_setting,
                    use_triangles=self.use_triangles_setting,
                    use_nurbs=self.use_nurbs_setting,
                    use_vertex_groups=self.use_vertex_groups_setting,
                    use_blen_objects=self.use_blen_objects_setting,
                    group_by_object=self.group_by_object_setting,
                    group_by_material=self.group_by_material_setting,
                    keep_vertex_order=self.keep_vertex_order_setting,
                    global_scale=self.global_scale_setting,
                    path_mode=self.path_mode_setting,
                )
            item.select_set(False)

        # restore viewport selection
        for ob in viewport_selection:
            ob.select_set(True)

        return {"FINISHED"}


# Only needed if you want to add into a dynamic menu
def menu_func_import(self, context):
    self.layout.operator(ExportMultipleObjs.bl_idname, text="Wavefront Batch (.obj)")


def register():
    bpy.utils.register_class(ExportMultipleObjs)
    bpy.types.TOPBAR_MT_file_export.append(menu_func_import)


def unregister():
    bpy.utils.unregister_class(ExportMultipleObjs)
    bpy.types.TOPBAR_MT_file_export.remove(menu_func_import)


if __name__ == "__main__":
    register()

    # test call
    # bpy.ops.export_scene.multiple_objs('INVOKE_DEFAULT')

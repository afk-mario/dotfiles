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

# Based on: https://blender.stackexchange.com/a/31852/

bl_info = {
    "name": "Batch Export GLTF",
    "author": "brockmann",
    "version": (0, 1),
    "blender": (2, 91, 0),
    "location": "File > Import-Export",
    "description": "Batch Export GLTF files",
    "warning": "",
    "wiki_url": "",
    "tracker_url": "",
    "category": "Import-Export",
}


import os

import bpy
from bpy.props import (
    BoolProperty,
    CollectionProperty,
    EnumProperty,
    FloatProperty,
    IntProperty,
    StringProperty,
)
from bpy_extras.io_utils import ExportHelper


class ExportMultiGLTF(bpy.types.Operator, ExportHelper):
    """Batch export objects as gltf files"""

    bl_idname = "export_scene.batch_gltf"
    bl_label = "Batch export GLTF"
    bl_options = {"PRESET", "UNDO"}

    # ExportHelper mixin class uses this
    filename_ext = ""

    filter_glob: StringProperty(default="*.glb;*.gltf", options={"HIDDEN"})

    # List of operator properties, the attributes will be assigned
    # to the class instance from the operator setting before calling.
    batch_export_format: EnumProperty(
        name="Format",
        items=(
            (
                "GLB",
                "glTF Binary (.glb)",
                "Exports a single file, with all data packed in binary form. "
                "Most efficient and portable, but more difficult to edit later",
            ),
            (
                "GLTF_EMBEDDED",
                "glTF Embedded (.gltf)",
                "Exports a single file, with all data packed in JSON. "
                "Less efficient than binary, but easier to edit later",
            ),
            (
                "GLTF_SEPARATE",
                "glTF Separate (.gltf + .bin + textures)",
                "Exports multiple files, with separate JSON, binary and texture data. "
                "Easiest to edit later",
            ),
        ),
        description=(
            "Output format and embedding options. Binary is most efficient, "
            "but JSON (embedded or separate) may be easier to edit later"
        ),
        default="GLB",
    )

    batch_export_copyright: StringProperty(
        name="Copyright",
        description="Legal rights and conditions for the model",
        default="",
    )

    batch_export_selection: BoolProperty(
        name="Selection Only",
        description="Export selected objects only",
        default=True,
    )

    batch_export_image_format: EnumProperty(
        name="Images",
        items=(
            (
                "AUTO",
                "Automatic",
                "Save PNGs as PNGs and JPEGs as JPEGs.\n" "If neither one, use PNG",
            ),
            (
                "JPEG",
                "JPEG Format (.jpg)",
                "Save images as JPEGs. (Images that need alpha are saved as PNGs though.)\n"
                "Be aware of a possible loss in quality",
            ),
        ),
        description=(
            "Output format for images. PNG is lossless and generally preferred, but JPEG might be preferable for web "
            "applications due to the smaller file size"
        ),
        default="AUTO",
    )

    batch_export_levels: IntProperty(
        name="Collection Levels", description="Set the levels of collections", default=2
    )

    batch_export_materials: EnumProperty(
        name="Materials",
        items=(
            ("EXPORT", "Export", "Export all materials used by included objects"),
            (
                "PLACEHOLDER",
                "Placeholder",
                "Do not export materials, but write multiple primitive groups per mesh, keeping material slot information",
            ),
            (
                "NONE",
                "No export",
                "Do not export materials, and combine mesh primitive groups, losing material slot information",
            ),
        ),
        description="Export materials ",
        default="EXPORT",
    )

    batch_export_colors: BoolProperty(
        name="Export Vertex Colors",
        description="Export vertex colors with meshes",
        default=True,
    )

    batch_export_cameras: BoolProperty(
        name="Export Cameras", description="Export cameras", default=False
    )

    batch_export_extras: BoolProperty(
        name="Export Custom Properties",
        description="Export custom properties as glTF extras",
        default=False,
    )

    batch_export_apply: BoolProperty(
        name="Export Apply Modifiers",
        description="Apply modifiers (excluding Armatures) to mesh objects -"
        "WARNING: prevents exporting shape keys",
        default=False,
    )

    batch_export_yup: BoolProperty(
        name="+Y Up", description="Export using glTF convention, +Y up", default=True
    )

    def execute(self, context):

        # get the folder
        folder_path = os.path.dirname(self.filepath)

        # get objects selected in the viewport
        viewport_selection = context.selected_objects

        # get export objects
        obj_export_list = viewport_selection
        if self.batch_export_selection == False:
            obj_export_list = [i for i in context.scene.objects]

        # deselect all objects
        bpy.ops.object.select_all(action="DESELECT")

        for item in obj_export_list:
            item.select_set(True)
            # if item.type == 'MESH':
            file_path = os.path.join(folder_path, "{}".format(item.name))

            bpy.ops.export_scene.gltf(
                filepath=file_path,
                export_selected=self.batch_export_selection,
                export_format=self.batch_export_format,
                export_copyright=self.batch_export_copyright,
                export_image_format=self.batch_export_image_format,
                export_materials=self.batch_export_materials,
                export_colors=self.batch_export_colors,
                export_cameras=self.batch_export_cameras,
                export_extras=self.batch_export_extras,
                export_yup=self.batch_export_yup,
                export_apply=self.batch_export_apply,
            )

            item.select_set(False)

        # restore viewport selection
        for ob in viewport_selection:
            ob.select_set(True)

        return {"FINISHED"}


# Only needed if you want to add into a dynamic menu
def menu_func_import(self, context):
    self.layout.operator(
        ExportMultiGLTF.bl_idname, text="Batch Export glTF 2.0 (.glb/.gltf)"
    )


def register():
    bpy.utils.register_class(ExportMultiGLTF)
    bpy.types.TOPBAR_MT_file_export.append(menu_func_import)


def unregister():
    bpy.utils.unregister_class(ExportMultiGLTF)
    bpy.types.TOPBAR_MT_file_export.remove(menu_func_import)


if __name__ == "__main__":
    register()

    # test call
    # bpy.ops.export_scene.multiple_objs('INVOKE_DEFAULT')

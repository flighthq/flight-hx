package;

class MeshLimeNekoSmoke {
  static function main():Void {
    final geometry = flight.Mesh.createBoxMeshGeometry(1, 1, 1);
    if (geometry.bounds == null) throw 'box geometry has no bounds';
    Sys.println('MESH_LIME_NEKO_OK');
  }
}

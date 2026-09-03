package;

class TypedStructClassSmoke {
  static function main():Void {
    run();
  }

  public static function run():Void {
    final camera = flight.Camera.createCamera2D(640, 480, {x: 12, y: 34, zoom: 2, rotation: 0.25});
    if (camera.x != 12 || camera.y != 34 || camera.zoom != 2 || camera.rotation != 0.25) {
      throw 'Camera2D construction lost field values';
    }
    if (camera.viewportWidth != 640 || camera.viewportHeight != 480) {
      throw 'Camera2D construction lost viewport values';
    }
    final baseNode = flight.Node.createNode('ClassSmokeNode');
    final node2D = flight.Scene2D.createNode2D('ClassSmokeNode2D');
    final node3D = flight.Scene3D.createNode3D('ClassSmokeNode3D');
    final displayObject = flight.Scene2D.createDisplayObject();
    final matrix4 = flight.Geometry.createMatrix4();
    if (!baseNode.enabled || baseNode.kind != 'ClassSmokeNode' || baseNode.data != null) {
      throw 'base Node class construction lost field values';
    }
    if (node2D.x != 0 || node2D.scaleX != 1 || !node2D.visible || node2D.kind != 'ClassSmokeNode2D') {
      throw 'Node2D class construction lost trait values';
    }
    if (node3D.position.x != 0 || node3D.scale.x != 1 || !node3D.visible || node3D.kind != 'ClassSmokeNode3D') {
      throw 'Node3D class construction lost trait values';
    }
    if (!displayObject.enabled || displayObject.x != 0 || matrix4.m.length != 16) {
      throw 'wholesale Entity class construction lost field values';
    }
    #if !flight_struct_typedef
    if (!Std.isOfType(camera, flight.types.Camera2D)) {
      throw 'Camera2D cpp pilot did not construct a class instance';
    }
    if (Type.getClass(baseNode) == null || Type.getClass(node2D) == null || Type.getClass(node3D) == null) {
      throw 'direct Node allocator did not preserve nominal class identity';
    }
    if (!Std.isOfType(node2D, flight.types.Node2D) || !Std.isOfType(node3D, flight.types.Node3D)) {
      throw 'concrete Node factory did not construct its public class identity';
    }
    if (!Std.isOfType(displayObject, flight.types.DisplayObject)) {
      throw 'derived Node factory did not construct its public class identity';
    }
    if (!Std.isOfType(matrix4, flight.types.Matrix4)) {
      throw 'ordinary Entity factory did not construct its public class identity';
    }
    #end
  }
}

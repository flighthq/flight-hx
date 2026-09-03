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
    final particleEmitter2D = flight.ParticleEmitter.createParticleEmitter2D();
    final particleEmitter3D = flight.ParticleEmitter.createParticleEmitter3D();
    final shape = flight.Shape.createShape();
    final richText = flight.Text.createRichText();
    final ambientLight = flight.Lighting.createAmbientLight();
    final standardMaterial = flight.Materials.createStandardMaterial();
    final standardPbrMaterial = flight.Materials.createStandardPbrMaterial();
    final vertexColorMaterial = flight.Materials.createVertexColorMaterial();
    final shadedMaterial = flight.Shading.createShadedMaterial();
    final matrix4 = flight.Geometry.createMatrix4();
    final vector3 = flight.Geometry.createVector3(1, 2, 3);
    final vector3Input:{var max:flight.types.Vector3Like;} = {max: vector3};
    final meshMaterials:Array<Null<flight.types.Material<Dynamic>>> = [standardPbrMaterial, vertexColorMaterial];
    final gltfDocument = flight.Scene3DFormats.parseGltf('{"asset":{"version":"2.0"},"materials":[{}]}');
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
    if (vector3Input.max.z != 3 || meshMaterials.length != 2 || gltfDocument.materials.length != 1) {
      throw 'nominal entities were rejected by structural input seams';
    }
    if (!particleEmitter2D.enabled || particleEmitter2D.x != 0 || !particleEmitter3D.enabled) {
      throw 'derived Node class construction lost field values';
    }
    #if !flight_struct_typedef
    final displayNode:flight.types.Node2D = displayObject;
    final emitter2DNode:flight.types.Node2D = particleEmitter2D;
    final emitter3DNode:flight.types.Node3D = particleEmitter3D;
    final shapeNode:flight.types.Node2D = shape;
    final richTextLabel:flight.types.TextLabel = richText;
    final richTextNode:flight.types.Node2D = richText;
    final lightBase:flight.types.Light = ambientLight;
    final standardMaterialBase:flight.types.Material = standardMaterial;
    final standardPbrSurface:flight.types.SurfaceMaterial = standardPbrMaterial;
    final standardPbrBase:flight.types.Material<Dynamic> = standardPbrMaterial;
    final vertexColorSurface:flight.types.SurfaceMaterial = vertexColorMaterial;
    final vertexColorBase:flight.types.Material<Dynamic> = vertexColorMaterial;
    final shadedSurface:flight.types.SurfaceMaterial = shadedMaterial;
    final shadedMaterialBase:flight.types.Material = shadedMaterial;
    if (!Std.isOfType(camera, flight.types.Camera2D)) {
      throw 'Camera2D cpp pilot did not construct a class instance';
    }
    if (Type.getClass(baseNode) == null || Type.getClass(node2D) == null || Type.getClass(node3D) == null) {
      throw 'direct Node allocator did not preserve nominal class identity';
    }
    if (!Std.isOfType(node2D, flight.types.Node2D) || !Std.isOfType(node3D, flight.types.Node3D)) {
      throw 'concrete Node factory did not construct its public class identity';
    }
    if (!Std.isOfType(displayObject, flight.types.DisplayObject) || !Std.isOfType(displayObject, flight.types.Node2D)) {
      throw 'derived Node factory did not construct its inherited public class identity';
    }
    if (
      !Std.isOfType(particleEmitter2D, flight.types.ParticleEmitter2D) ||
      !Std.isOfType(particleEmitter2D, flight.types.Node2D) ||
      !Std.isOfType(particleEmitter3D, flight.types.ParticleEmitter3D) ||
      !Std.isOfType(particleEmitter3D, flight.types.Node3D)
    ) {
      throw 'cross-module Node factory did not construct its public class identity';
    }
    if (
      !Std.isOfType(shape, flight.types.Node2D) ||
      !Std.isOfType(richText, flight.types.TextLabel) ||
      !Std.isOfType(richText, flight.types.Node2D) ||
      !Std.isOfType(ambientLight, flight.types.Light) ||
      !Std.isOfType(standardMaterial, flight.types.Material) ||
      !Std.isOfType(standardPbrMaterial, flight.types.SurfaceMaterial) ||
      !Std.isOfType(standardPbrMaterial, flight.types.Material) ||
      !Std.isOfType(gltfDocument.materials[0], flight.types.StandardPbrMaterial) ||
      !Std.isOfType(vertexColorMaterial, flight.types.SurfaceMaterial) ||
      !Std.isOfType(vertexColorMaterial, flight.types.Material) ||
      !Std.isOfType(shadedMaterial, flight.types.SurfaceMaterial) ||
      !Std.isOfType(shadedMaterial, flight.types.Material)
    ) {
      throw 'generated Entity subclasses did not preserve their source hierarchy';
    }
    if (!Std.isOfType(matrix4, flight.types.Matrix4)) {
      throw 'ordinary Entity factory did not construct its public class identity';
    }
    assertOpenLightDescriptorClass(ambientLight);
    #end
  }

  static function acceptRenderState(_:flight.types.RenderState):Void {}

  static function typecheckGlRenderStateInheritance(state:flight.types.GlRenderState):Void {
    acceptRenderState(state);
  }

  #if !flight_struct_typedef
  static function assertOpenLightDescriptorClass(ambientLight:flight.types.AmbientLight):Void {
    final light = flight._SceneDocument.readLight__flightDocumentText(
      {
        descriptor: {kind: 'AmbientLight', intensity: 0.4},
        transform: {
          position: {x: 0, y: 0, z: 0},
          rotation: {x: 0, y: 0, z: 0, w: 1},
          scale: {x: 1, y: 1, z: 1},
        },
      },
      'scenes[0].lights[0]',
      cast {refusal: null}
    );
    if (light == null) throw 'open Light descriptor was refused';
    final descriptor = light.descriptor;
    if (
      !Std.isOfType(descriptor, flight.types.Light) ||
      descriptor.kind != ambientLight.kind ||
      flight._internal._Runtime.getIndex(descriptor, 'intensity') != 0.4
    ) {
      throw 'open Light descriptor did not construct the Light base class';
    }
  }
  #end
}

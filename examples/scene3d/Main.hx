import flighthq.Sdk;import flighthq.SceneGl;import lime.graphics.RenderContext;
class Main extends ExampleHost {
  var scene:Dynamic;var camera:Dynamic;var lights:Dynamic;var meshes:Array<Dynamic>=[];
  override public function flightReady():Void {
    scene=Sdk.createSceneNode(Sdk.SceneNodeKind);final geometries=[Sdk.createBoxMeshGeometry(),Sdk.createSphereMeshGeometry(.5,32,20),Sdk.createConeMeshGeometry(.5,1,32)];final colors=[0xcc3333ff,0xaaaaaaff,0x3366ccff];
    for(i in 0...3){final mesh=Sdk.createMesh(geometries[i],[Sdk.createStandardPbrMaterial({baseColor:colors[i],metallic:i==1?1:0,roughness:.4})]);mesh.position.x=(i-1)*2;Sdk.invalidateNodeLocalTransform(mesh);Sdk.addNodeChild(scene,mesh);meshes.push(mesh);}
    camera=Sdk.createCamera({near:.1,far:100,projection:Sdk.createPerspectiveProjection({aspect:4/3,fovY:Math.PI/4})});Sdk.setCameraViewMatrix4FromLookAt(camera,Sdk.createVector3(4,3,5),Sdk.createVector3(),Sdk.createVector3(0,1,0));
    final direction=Sdk.createVector3(-1,-.5,-.7);Sdk.normalizeVector3(direction,direction);lights={ambient:Sdk.createAmbientLight({color:0x607090ff,intensity:.2}),directional:Sdk.createDirectionalLight({color:0xffffffff,direction:direction,intensity:3})};SceneGl.registerStandardPbrGlMaterial(renderState);
  }
  override public function flightUpdate(dt:Float):Void for(i in 0...meshes.length){meshes[i].rotation.y+=dt*(.4+i*.2);Sdk.invalidateNodeLocalTransform(meshes[i]);}
  override public function flightRender(context:RenderContext):Void {Sdk.renderGlBackground(renderState);Sdk.prepareSceneRender(renderState,scene,camera,lights);SceneGl.drawGlScene(renderState,scene,camera,lights);}
}

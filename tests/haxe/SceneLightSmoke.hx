package;

import flight.Camera.createCamera3D;
import flight.Camera.createPerspectiveProjection;
import flight.Geometry.createVector3;
import flight.Geometry.normalizeVector3;
import flight.Lighting.createAmbientLight;
import flight.Lighting.createDirectionalLight;
import flight.Render.prepareScene3DRender;
import flight.Scene3D.createNode3D;
import flight.types.RenderState;
import flight.types.Scene3DLights;

class SceneLightSmoke {
  static function main():Void {
    final direction = createVector3(-1, -0.5, -0.7);
    normalizeVector3(direction, direction);
    final lights:Scene3DLights = {
      ambient: createAmbientLight({color: 0x607090ff, intensity: 0.2}),
      directional: createDirectionalLight({color: 0xffffffff, direction: direction, intensity: 3}),
    };
    final scene = createNode3D();
    final camera = createCamera3D({
      far: 100,
      near: 0.1,
      projection: createPerspectiveProjection({aspect: 4 / 3, fovY: Math.PI / 4}),
    });
    final createRenderState = Reflect.field(flight._Render, 'createRenderState');
    final state:RenderState = cast Reflect.callMethod(flight._Render, createRenderState, []);
    final list = prepareScene3DRender(state, scene, camera, lights);
    if (
      list.lights.data == null ||
      list.lights.version != 1 ||
      list.lights.ambientCount != 1 ||
      list.lights.directionalCount != 1
    ) {
      throw 'scene light block was not packed';
    }
    final pointData = list.lights.data.subarray(16, 24);
    if (pointData.length != 8) throw 'scene light block subarray failed';
  }
}

package;

import flighthq.camera.Camera.createCamera;
import flighthq.camera.Camera.createPerspectiveProjection;
import flighthq.geometry.Vector3.createVector3;
import flighthq.geometry.Vector3.normalizeVector3;
import flighthq.lighting.AmbientLight.createAmbientLight;
import flighthq.lighting.DirectionalLight.createDirectionalLight;
import flighthq.render.SceneRender.prepareSceneRender;
import flighthq.scene.SceneNode.createSceneNode;
import flighthq.types.RenderState;
import flighthq.types.SceneLights;

class SceneLightSmoke {
  static function main():Void {
    final direction = createVector3(-1, -0.5, -0.7);
    normalizeVector3(direction, direction);
    final lights:SceneLights = {
      ambient: createAmbientLight({color: 0x607090ff, intensity: 0.2}),
      directional: createDirectionalLight({color: 0xffffffff, direction: direction, intensity: 3}),
    };
    final scene = createSceneNode();
    final camera = createCamera({
      far: 100,
      near: 0.1,
      projection: createPerspectiveProjection({aspect: 4 / 3, fovY: Math.PI / 4}),
    });
    final state:RenderState = cast {};
    final list = prepareSceneRender(state, scene, camera, lights);
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

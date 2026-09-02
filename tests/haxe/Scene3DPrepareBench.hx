package;

import flight.Camera.createCamera3D;
import flight.Camera.createPerspectiveProjection;
import flight.Camera.setCamera3DViewMatrix4FromLookAt;
import flight.Geometry.createVector3;
import flight.Lighting.createScene3DLights;
import flight.Mesh.createBoxMeshGeometry;
import flight.Node.addNodeChild;
import flight.Node.invalidateNodeLocalTransform;
import flight.Render.prepareScene3DRender;
import flight.Scene3D.createMesh;
import flight.Scene3D.createNode3D;
import flight.types.Mesh;
import flight.types.RenderState;

class Scene3DPrepareBench {
  static final branchCount = 8;
  static final meshesPerBranch = 16;
  static final warmupIterations = 100;

  static function main():Void {
    final iterations = readPositiveInt('FLIGHT_SCENE3D_BENCH_ITERATIONS', 500);
    final state:RenderState = cast {sceneGraphSyncPolicy: 'requiresInvalidation'};
    final lights = createScene3DLights();
    final camera = createCamera3D({
      far: 100,
      near: 0.1,
      projection: createPerspectiveProjection({aspect: 16 / 9, fovY: Math.PI / 3}),
    });
    final scene = createNode3D();
    final geometry = createBoxMeshGeometry(0.35, 0.35, 0.35);
    final movers:Array<Mesh> = [];
    final cameraEye = createVector3();
    final cameraTarget = createVector3(0, 0, -7);
    final cameraUp = createVector3(0, 1, 0);

    for (branchIndex in 0...branchCount) {
      final branch = createNode3D();
      branch.position.z = -6 - branchIndex * 0.75;
      invalidateNodeLocalTransform(branch);
      addNodeChild(scene, branch);

      for (meshIndex in 0...meshesPerBranch) {
        final mesh = createMesh(geometry, []);
        mesh.position.x = (meshIndex % 8 - 3.5) * 0.55;
        mesh.position.y = (Math.floor(meshIndex / 8) - 0.5) * 0.55;
        invalidateNodeLocalTransform(mesh);
        addNodeChild(branch, mesh);
        if (meshIndex % 4 == 0) movers.push(mesh);
      }
    }

    runIterations(state, scene, camera, lights, movers, cameraEye, cameraTarget, cameraUp, warmupIterations);
    final start = haxe.Timer.stamp();
    final checksum = runIterations(state, scene, camera, lights, movers, cameraEye, cameraTarget, cameraUp, iterations);
    final elapsedMs = (haxe.Timer.stamp() - start) * 1000;
    final nodeVisits = iterations * (1 + branchCount + branchCount * meshesPerBranch);
    Sys.println(haxe.Json.stringify({
      checksum: checksum,
      elapsedMs: elapsedMs,
      iterations: iterations,
      meshCount: branchCount * meshesPerBranch,
      nanosecondsPerNodeVisit: elapsedMs * 1000000 / nodeVisits,
    }));
  }

  static function runIterations(
      state:RenderState,
      scene:flight.types.Node3D,
      camera:flight.types.Camera3D,
      lights:flight.types.Scene3DLights,
      movers:Array<Mesh>,
      cameraEye:flight.types.Vector3,
      cameraTarget:flight.types.Vector3,
      cameraUp:flight.types.Vector3,
      iterations:Int
  ):Float {
    var checksum = 0.0;
    for (frame in 0...iterations) {
      final phase = frame * 0.013;
      cameraEye.x = Math.sin(phase) * 0.25;
      setCamera3DViewMatrix4FromLookAt(camera, cameraEye, cameraTarget, cameraUp);
      for (moverIndex in 0...movers.length) {
        final mover = movers[moverIndex];
        mover.position.y = Math.sin(phase + moverIndex * 0.17) * 0.3;
        invalidateNodeLocalTransform(mover);
      }
      final list = prepareScene3DRender(state, scene, camera, lights, 16 / 9);
      checksum += list.meshCount + list.viewProjection.m[0];
    }
    return checksum;
  }

  static function readPositiveInt(name:String, fallback:Int):Int {
    final value = Sys.getEnv(name);
    if (value == null) return fallback;
    final parsed = Std.parseInt(value);
    return parsed != null && parsed > 0 ? parsed : fallback;
  }
}

// Line-by-line Haxe/Lime port of the upstream `scene3d` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and its one-shot `render(scene, camera, lights)` call are replaced by
// Lime's window/render lifecycle, and the Flight app backend is wired with
// `App.setAppBackend(createLimeAppBackend(this))`. Every statement is otherwise translated faithfully.
//
// This is a 3D scene: it does not use the 2D display-object render path. The upstream `render.webgl`
// module (registerStandardPbrGlMaterial + a HDR/depth GlRenderEffectPipeline + prepareSceneRender +
// drawGlScene) is inlined into `onWindowCreate` (setup) and `render(context)` (the per-frame draw).
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.Camera3D;
import flighthq.types.SceneLights;
import flighthq.types.SceneNode;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.KeyCode;
import lime.ui.KeyModifier;
import lime.ui.Window;

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;

  // The HDR/depth effect pipeline the upstream `render.webgl` module allocates.
  var pipeline:Dynamic;

  var scene:SceneNode;
  var camera:Camera3D;
  var lights:SceneLightsLike;

  public function new() {
    super();
  }

  // Lime: window/GL are ready. Wire the Flight Lime backend, set up the GL renderer, build the scene.
  override public function onWindowCreate():Void {
    App.setAppBackend(LimeApp.createLimeAppBackend(this));
    switch (window.context.type) {
      case OPENGL, OPENGLES, WEBGL:
      default:
        throw 'Flight examples require an OpenGL/WebGL render context.';
    }
    scale = window.scale;
    final canvas = new _GlCanvas(window);
    renderState = createGlRenderState(canvas, {
      pixelRatio: window.scale,
      backgroundColor: 0x0a0c10ff,
      contextAttributes: {alpha: false, preserveDrawingBuffer: true},
    });
    registerStandardPbrGlMaterial(renderState);
    pipeline = createGlRenderEffectPipeline(renderState, {
      sampleCount: 4,
      format: 'rgba16f',
      depth: 'depth-stencil',
    });

    final logicalWidth = 800 / scale;
    final logicalHeight = 600 / scale;

    // Three procedural mesh primitives arranged side by side.
    final boxGeometry = createBoxMeshGeometry(1, 1, 1);
    final sphereGeometry = createSphereMeshGeometry(0.5, 48, 32);
    final coneGeometry = createConeMeshGeometry(0.5, 1, 32);

    // Each mesh has a distinct StandardPbr material: warm red dielectric, gray metallic, cool blue dielectric.
    final redMaterial = createStandardPbrMaterial({
      baseColor: 0xcc3333ff,
      metallic: 0,
      roughness: 0.4,
    });

    final grayMetallicMaterial = createStandardPbrMaterial({
      baseColor: 0xaaaaaaff,
      metallic: 1,
      roughness: 0.3,
    });

    final blueMaterial = createStandardPbrMaterial({
      baseColor: 0x3366ccff,
      metallic: 0,
      roughness: 0.5,
    });

    scene = createSceneNode(SceneNodeKind);

    final boxMesh = createMesh(boxGeometry, [redMaterial]);
    // A node's transform is authored via its `position`/`rotation`/`scale` fields; invalidate after editing.
    boxMesh.position.x = -2;
    invalidateNodeLocalTransform(boxMesh);
    addNodeChild(scene, boxMesh);

    // sphereMesh stays at the origin — a fresh node's position defaults to (0, 0, 0).
    final sphereMesh = createMesh(sphereGeometry, [grayMetallicMaterial]);
    addNodeChild(scene, sphereMesh);

    final coneMesh = createMesh(coneGeometry, [blueMaterial]);
    coneMesh.position.x = 2;
    invalidateNodeLocalTransform(coneMesh);
    addNodeChild(scene, coneMesh);

    // Perspective camera viewing the scene from a 3/4 angle.
    camera = createCamera3D({
      far: 100,
      near: 0.1,
      projection: createPerspectiveProjection({aspect: logicalWidth / logicalHeight, fovY: Math.PI / 4}),
    });
    setCamera3DViewMatrix4FromLookAt(camera, createVector3(4, 3, 5), createVector3(0, 0, 0), createVector3(0, 1, 0));

    // White directional light from the upper right plus a dim ambient fill.
    final directionalDirection = createVector3(-1, -0.5, -0.7);
    normalizeVector3(directionalDirection, directionalDirection);
    lights = {
      ambient: createAmbientLight({color: 0x607090ff, intensity: 0.2}),
      directional: createDirectionalLight({
        color: 0xffffffff,
        direction: directionalDirection,
        intensity: 3,
      }),
    };

    ready = true;
  }

  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {}

  // The upstream program renders once; Lime re-renders every frame with no per-frame state changes.
  override public function update(deltaTime:Int):Void {}

  // Upstream `render(scene, camera, lights)`, driven by Lime's per-frame `render`.
  override public function render(context:RenderContext):Void {
    if (!ready || scene == null) return;
    beginGlRenderEffectPipeline(renderState, pipeline);
    renderGlBackground(renderState);
    final gl = renderState.gl;
    gl.depthMask(true);
    gl.clearDepth(1);
    gl.clear(gl.DEPTH_BUFFER_BIT);
    prepareSceneRender(renderState, scene, camera, lights);
    drawGlScene(renderState, scene, camera, lights);
    endGlRenderEffectPipeline(renderState, pipeline, ([] : Array<Dynamic>));
  }
}

// Minimal GL canvas adapter over the Lime window, matching the shape `createGlRenderState` expects.
private class _GlCanvas {
  public var width(get, never):Int;
  public var height(get, never):Int;

  final window:Window;
  final context:Dynamic;

  public function new(window:Window) {
    this.window = window;
    context = resolveContext(window);
    if (context == null) throw 'Flight examples require a hardware OpenGL/WebGL window.';
  }

  public function getContext(contextId:String, ?attributes:Dynamic):Dynamic {
    return context;
  }

  function get_width():Int {
    return window.width;
  }

  function get_height():Int {
    return window.height;
  }

  static function resolveContext(window:Window):Dynamic {
    final renderContext:Dynamic = window.context;
    if (renderContext == null) return null;
    final webgl2 = renderContext.webgl2;
    return webgl2 == null ? renderContext.webgl : webgl2;
  }
}

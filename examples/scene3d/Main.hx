// Line-by-line Haxe/Lime port of the upstream `scene3d` example (`app.ts` + `render.webgl.ts`),
// written directly against the generated Flight Haxe surface (`flight.*`). It is a standalone
// `lime.app.Application`: the browser `./render` module is replaced by Lime's window/render
// lifecycle, the canvas pointer/wheel listeners by Lime's mouse callbacks, and the Flight app
// host capabilities are enabled with `HostLime.enableHostLime(this)`. Every statement is
// otherwise translated faithfully.
//
// This is a 3D scene: it does not use the 2D display-object render path. The upstream `render.webgl`
// module (registerGlStandardPbrMaterial + a HDR/depth GlRenderEffectPipeline + the shadow-map pass +
// prepareScene3DRender + drawGlScene3D) is inlined into `onWindowCreate` (setup) and
// `render(context)` (the per-frame draw).
import flight.hostLime.HostLime;
import flight.Sdk.*;
import flight.types.Camera3D;
import flight.types.Scene3DLights;
import flight.types.Node3D;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.KeyCode;
import lime.ui.KeyModifier;
import lime.ui.MouseButton;
import lime.ui.MouseWheelMode;
import lime.ui.Window;

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;

  // The HDR/depth effect pipeline the upstream `render.webgl` module allocates.
  var pipeline:Dynamic;

  var scene:Node3D;
  var camera:Camera3D;
  var shadowCamera:Camera3D;
  var lights:Scene3DLights;
  var cameraController:Dynamic;

  // Upstream pointer-drag state (`dragging`/`previousPointerX`/`previousPointerY`).
  var dragging = false;
  var previousPointerX = 0.0;
  var previousPointerY = 0.0;

  // Upstream drives frames with requestAnimationFrame timestamps; Lime supplies the delta in
  // `update(deltaTime)` and draws in `render`, so the clamped dt is carried between the two.
  var frameDeltaSeconds = 0.0;

  public function new() {
    super();
  }

  // Lime: window/GL are ready. Wire the Flight Lime backend, set up the GL renderer, build the scene.
  override public function onWindowCreate():Void {
    HostLime.enableHostLime(this);
    switch (window.context.type) {
      case OPENGL, OPENGLES, WEBGL:
      default:
        throw 'Flight examples require an OpenGL/WebGL render context.';
    }
    scale = window.scale;
    final canvas = flight.hostLime.GlSurface.createGlSurface(window);
    renderState = createGlRenderState(createGlContextState(createGlContextFromCanvasElement(canvas, {contextAttributes: {alpha: false, preserveDrawingBuffer: true}})), createGlPipeline(createEmptyGlRegistries()), {
      pixelRatio: window.scale,
      backgroundColor: 0x0a0c10ff,
    });
    registerStandardGlTextureResolvers(renderState);
    registerGlStandardPbrMaterial(renderState);
    pipeline = createGlRenderEffectPipeline(renderState, {
      sampleCount: 4,
      format: 'rgba16f',
      depth: 'depth-stencil',
    });

    final logicalWidth = 800 / scale;
    final logicalHeight = 600 / scale;

    // Three procedural mesh primitives arranged above a shared shadow receiver.
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

    scene = createNode3D(Node3DKind);

    final ground = createMesh(createPlaneMeshGeometry(7, 5, 7, 5), [
      createStandardPbrMaterial({
        baseColor: 0x182235ff,
        metallic: 0,
        roughness: 0.86,
      }),
    ]);
    ground.position.y = -0.75;
    invalidateNodeLocalTransform(ground);
    addNodeChild(scene, ground);

    final boxMesh = createMesh(boxGeometry, [redMaterial]);
    // A node's transform is authored via its `position`/`rotation`/`scale` fields; invalidate after editing.
    boxMesh.position.x = -2;
    boxMesh.position.y = -0.25;
    invalidateNodeLocalTransform(boxMesh);
    addNodeChild(scene, boxMesh);

    final sphereMesh = createMesh(sphereGeometry, [grayMetallicMaterial]);
    sphereMesh.position.y = -0.25;
    invalidateNodeLocalTransform(sphereMesh);
    addNodeChild(scene, sphereMesh);

    final coneMesh = createMesh(coneGeometry, [blueMaterial]);
    coneMesh.position.x = 2;
    coneMesh.position.y = -0.25;
    invalidateNodeLocalTransform(coneMesh);
    addNodeChild(scene, coneMesh);

    // Perspective camera viewing the scene from a 3/4 angle.
    camera = createCamera3D({
      far: 100,
      near: 0.1,
      projection: createPerspectiveProjection({aspect: logicalWidth / logicalHeight, fovY: Math.PI / 4}),
    });

    cameraController = createOrbitCameraController({
      azimuth: 0.68,
      distance: 7,
      polar: 0.38,
      smoothTime: 0.12,
      target: createVector3(0, -0.25, 0),
    });

    // A shadow-casting sun supplies the key light. The point light adds a cool local highlight while
    // ambient light keeps the shadowed faces legible.
    final directionalDirection = createVector3(-1, -0.5, -0.7);
    normalizeVector3(directionalDirection, directionalDirection);
    final directionalLight = createDirectionalLight({
      castsShadow: true,
      color: 0xffe3c4ff,
      direction: directionalDirection,
      intensity: 3,
      normalBias: 0.003,
      pcfRadius: 1,
      shadowBias: 0.001,
    });
    lights = {
      ambient: createAmbientLight({color: 0x607090ff, intensity: 0.2}),
      directional: directionalLight,
      point: [
        createPointLight({
          color: 0x5ea8ffff,
          intensity: 8,
          position: createVector3(1.8, 1.6, 2),
          range: 7,
        }),
      ],
    };

    shadowCamera = createCamera3D({
      far: 20,
      near: 0.1,
      projection: createOrthographicProjection({halfHeight: 4, halfWidth: 4}),
    });
    configureDirectionalShadowCamera3D(shadowCamera, directionalDirection, createAabb(-3.5, -0.8, -2.5, 3.5, 1, 2.5));

    updateOrbitCameraController(cameraController, camera, 1);
    ready = true;
  }

  // Upstream `pointerdown`/`pointermove`/`pointerup` orbit drag, via Lime mouse callbacks.
  override public function onMouseDown(x:Float, y:Float, button:MouseButton):Void {
    dragging = true;
    previousPointerX = x;
    previousPointerY = y;
  }

  override public function onMouseMove(x:Float, y:Float):Void {
    if (!dragging || cameraController == null) return;
    rotateOrbitCameraController(cameraController, -(x - previousPointerX) * 0.008, (y - previousPointerY) * 0.008);
    previousPointerX = x;
    previousPointerY = y;
  }

  override public function onMouseUp(x:Float, y:Float, button:MouseButton):Void {
    dragging = false;
  }

  override public function onMouseWheel(deltaX:Float, deltaY:Float, deltaMode:MouseWheelMode):Void {
    // Browsers deliver wheel deltas in pixels; Lime commonly reports lines (~40 px each).
    final pixels = deltaMode == PIXELS ? deltaY : deltaY * 40;
    if (cameraController != null) dollyOrbitCameraController(cameraController, pixels * 0.006);
  }

  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {}

  // Upstream `enterFrame`: clamp the frame delta, then advance the orbit camera before rendering.
  override public function update(deltaTime:Int):Void {
    frameDeltaSeconds = Math.min(deltaTime / 1000, 0.05);
  }

  // Upstream `render(scene, camera, lights, shadowCamera)`, driven by Lime's per-frame `render`.
  override public function render(context:RenderContext):Void {
    if (!ready || scene == null) return;
    updateOrbitCameraController(cameraController, camera, frameDeltaSeconds);
    final gl:Dynamic = renderState.gl;
    // Browser WebGL clears the default framebuffer's depth/stencil before every frame regardless of
    // preserveDrawingBuffer; Lime does not, so without this host-parity clear the present quad fails
    // the scene pass's leftover LESS depth test from frame 2 on and the window stays black.
    flight._internal.backend.WebGl2Backend.depthMask(gl, true);
    flight._internal.backend.WebGl2Backend.clearDepth(gl, 1);
    flight._internal.backend.WebGl2Backend.clear(gl, flight._internal.backend.WebGl2Backend.DEPTH_BUFFER_BIT);
    // The directional depth pass must finish before the HDR effect target opens its framebuffer.
    prepareScene3DRender(renderState, scene, camera, lights);
    // Upstream f1a7a9a0: the shadow pass now takes the owning directional light, whose
    // castsShadow/bias policy controls the map (null actively disables a previous map).
    drawGlScene3DShadowMap(renderState, scene, shadowCamera, lights.directional);
    beginGlRenderEffectPipeline(renderState, pipeline, 'linear');
    renderGlBackground(renderState);
    flight._internal.backend.WebGl2Backend.depthMask(gl, true);
    flight._internal.backend.WebGl2Backend.clearDepth(gl, 1);
    flight._internal.backend.WebGl2Backend.clear(gl, flight._internal.backend.WebGl2Backend.DEPTH_BUFFER_BIT);
    drawGlScene3D(renderState, scene, camera, lights);
    endGlRenderEffectPipeline(renderState, pipeline, cast []);
  }
}

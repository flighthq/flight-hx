// Line-by-line Haxe/Lime port of the upstream `skeleton` example (`app.ts` + `render.webgl.ts`),
// written directly against the generated Flight Haxe surface (`flighthq.*`). It is a standalone
// `lime.app.Application`: the browser `./render` module and `requestAnimationFrame` loop are replaced
// by Lime's window/render lifecycle, and the Flight app backend is wired with
// `App.setAppBackend(createLimeAppBackend(this))`. This is a 3D example — the render pass drives the
// scene-gl forward renderer (`prepareSceneRender` + `drawGlScene`) through a GL render-effect pipeline,
// faithful to the example's `render.webgl.ts`.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.Camera3D;
import flighthq.types.GlRenderEffectPipeline;
import flighthq.types.Mesh;
import flighthq.types.MeshGeometry;
import flighthq.types.Quaternion;
import flighthq.types.SceneLights.SceneLightsLike;
import flighthq.types.SceneNode;
import flighthq.types.Vector3;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.Window;
import lime.utils.UInt16Array;

class Main extends Application {
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var pipeline:GlRenderEffectPipeline;
  var ready = false;

  final JOINT_COUNT = 4;
  final SEGMENTS_PER_JOINT = 6;
  final RADIAL_SEGMENTS = 12;
  final SEGMENT_HEIGHT = 0.5;
  final TUBE_RADIUS = 0.5;
  var TOTAL_HEIGHT:Float;
  // Canonical skinned record: position(3) + normal(3) + tangent(4) + uv0(2) + joints0(4) + weights0(4).
  final FLOATS_PER_VERTEX = 20;

  var geometry:MeshGeometry;
  var scene:SceneNode;
  var jointNodes:Array<SceneNode> = [];
  var mesh:Mesh;
  var camera:Camera3D;
  var lights:SceneLightsLike;

  var q:Quaternion;
  var zAxis:Vector3;

  // Accumulated wall-clock milliseconds — the upstream `animate(time)` timestamp.
  var elapsedMs = 0.0;

  public function new() {
    super();
  }

  // Lime: window/GL are ready. Wire the Flight Lime backend, set up the GL scene renderer, build the scene.
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
      backgroundColor: 0x1a1c24ff,
      contextAttributes: {alpha: false, preserveDrawingBuffer: true},
    });
    registerStandardPbrGlMaterial(renderState);

    pipeline = createGlRenderEffectPipeline(renderState, {
      sampleCount: 4,
      format: 'rgba16f',
      depth: 'depth-stencil',
    });

    TOTAL_HEIGHT = JOINT_COUNT * SEGMENTS_PER_JOINT * SEGMENT_HEIGHT;

    final heightSegments = JOINT_COUNT * SEGMENTS_PER_JOINT;
    final verticesPerRing = RADIAL_SEGMENTS + 1;
    final ringCount = heightSegments + 1;
    final vertexCount = verticesPerRing * ringCount;
    final indexCount = RADIAL_SEGMENTS * heightSegments * 6;

    final vertices = new flighthq._internal._Float32Array(vertexCount * FLOATS_PER_VERTEX);
    final indices = new UInt16Array(indexCount);

    // A tube centered at the origin, extending along +Y. Each ring's vertices are weighted to the two
    // nearest joints so the surface bends smoothly across joint boundaries — this is the skin binding,
    // baked once into the geometry's joints0/weights0 channels.
    for (ring in 0...ringCount) {
      final y = -TOTAL_HEIGHT / 2 + (ring / heightSegments) * TOTAL_HEIGHT;
      final v = ring / heightSegments;

      final jointFrac = (ring / heightSegments) * (JOINT_COUNT - 1);
      final lowerJoint = Std.int(Math.min(Math.floor(jointFrac), JOINT_COUNT - 2));
      final upperJoint = lowerJoint + 1;
      final blend = jointFrac - lowerJoint;

      for (seg in 0...RADIAL_SEGMENTS + 1) {
        final angle = (seg / RADIAL_SEGMENTS) * Math.PI * 2;
        final nx = Math.cos(angle);
        final nz = Math.sin(angle);

        final vi = (ring * verticesPerRing + seg) * FLOATS_PER_VERTEX;
        // position
        vertices[vi] = nx * TUBE_RADIUS;
        vertices[vi + 1] = y;
        vertices[vi + 2] = nz * TUBE_RADIUS;
        // normal (radial outward)
        vertices[vi + 3] = nx;
        vertices[vi + 4] = 0;
        vertices[vi + 5] = nz;
        // tangent (along the ring circumference, w=1 for right-handed bitangent)
        vertices[vi + 6] = -nz;
        vertices[vi + 7] = 0;
        vertices[vi + 8] = nx;
        vertices[vi + 9] = 1;
        // uv0
        vertices[vi + 10] = seg / RADIAL_SEGMENTS;
        vertices[vi + 11] = v;
        // joints0 (the two influencing joint indices)
        vertices[vi + 12] = lowerJoint;
        vertices[vi + 13] = upperJoint;
        vertices[vi + 14] = 0;
        vertices[vi + 15] = 0;
        // weights0 (linear blend between them, summing to 1)
        vertices[vi + 16] = 1 - blend;
        vertices[vi + 17] = blend;
        vertices[vi + 18] = 0;
        vertices[vi + 19] = 0;
      }
    }

    // Triangle indices: two triangles per quad between adjacent rings.
    var idx = 0;
    for (ring in 0...heightSegments) {
      for (seg in 0...RADIAL_SEGMENTS) {
        final a = ring * verticesPerRing + seg;
        final b = a + verticesPerRing;
        indices[idx++] = a;
        indices[idx++] = b;
        indices[idx++] = a + 1;
        indices[idx++] = a + 1;
        indices[idx++] = b;
        indices[idx++] = b + 1;
      }
    }

    geometry = createMeshGeometry({
      indices: indices,
      layout: CANONICAL_SKINNED_MESH_GEOMETRY_LAYOUT,
      vertices: vertices,
    });

    // Build the joint hierarchy as SceneNodes in a chain along Y. Joint 0 is the root at the bottom of
    // the tube; each successive joint is offset upward by the segment span.
    scene = createSceneNode(SceneNodeKind);

    final jointSpacing = TOTAL_HEIGHT / (JOINT_COUNT - 1);
    for (j in 0...JOINT_COUNT) {
      final node = createSceneNode();
      if (j == 0) {
        node.position.y = -TOTAL_HEIGHT / 2;
        invalidateNodeLocalTransform(node);
        addNodeChild(scene, node);
      } else {
        node.position.y = jointSpacing;
        invalidateNodeLocalTransform(node);
        addNodeChild(jointNodes[j - 1], node);
      }
      jointNodes.push(node);
    }

    // createSkeleton3D with no explicit inverse-bind matrices captures the current joint poses as the
    // bind (rest) pose. Binding it to the mesh via the skin is all it takes to make the mesh skinnable.
    final material = createStandardPbrMaterial({baseColor: 0xe08040ff, metallic: 0, roughness: 0.45});
    mesh = createMesh(geometry, cast [material]);
    mesh.skin = {skeleton: createSkeleton3D(jointNodes)};
    addNodeChild(scene, mesh);

    camera = createCamera3D({
      far: 100,
      near: 0.1,
      projection: createPerspectiveProjection({aspect: 800 / 600, fovY: Math.PI / 4}),
    });
    setCamera3DViewMatrix4FromLookAt(camera, createVector3(6, 4, 10), createVector3(0, 0, 0), createVector3(0, 1, 0));

    final directionalDirection = createVector3(-1, -0.5, -0.7);
    normalizeVector3(directionalDirection, directionalDirection);
    lights = {
      ambient: createAmbientLight({color: 0x6080b0ff, intensity: 0.2}),
      directional: createDirectionalLight({color: 0xffffffff, direction: directionalDirection, intensity: 3}),
    };

    q = createQuaternion();
    zAxis = createVector3(0, 0, 1);

    ready = true;
  }

  // Upstream `animate(time)`, driven by Lime's per-frame `update` (deltaTime is milliseconds).
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    elapsedMs += deltaTime;
    final t = elapsedMs * 0.001;

    // Pose each joint with a sinusoidal Z-axis rotation; a per-joint phase offset gives a traveling wave.
    for (j in 0...JOINT_COUNT) {
      setQuaternionFromAxisAngle(q, zAxis, Math.sin(t * 2 + j * 1.2) * 0.3);
      copyQuaternion(jointNodes[j].rotation, q);
      invalidateNodeLocalTransform(jointNodes[j]);
    }

    // One call deforms the mesh from the posed skeleton and marks the geometry for re-upload.
    updateMeshSkin(mesh);
  }

  // Upstream `render(scene, camera, lights)` from `render.webgl.ts`, driven by Lime's per-frame `render`.
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
    endGlRenderEffectPipeline(renderState, pipeline, []);
  }
}

// Minimal GL canvas adapter over the Lime window, matching the shape `createGlRenderState` expects.
private class _GlCanvas {
  // Flight's GL renderer reads `canvas.width`/`canvas.height` reflectively (`Reflect.field`) to build
  // both the GL viewport and the pixel->clip projection. A Haxe `(get, never)` property compiles to
  // `get_width()` with no reflectable `width` field, so the reflective read returns `undefined`, the
  // viewport becomes 0x0 and the projection `2 / undefined` becomes NaN — every draw is discarded while
  // the (viewport/projection-independent) background clear still shows. So expose plain physical fields
  // and keep them in sync with the backing buffer size (device pixels = window size * scale).
  public var width:Int = 0;
  public var height:Int = 0;

  final window:Window;
  final context:Dynamic;

  public function new(window:Window) {
    this.window = window;
    context = resolveContext(window);
    if (context == null) throw 'Flight examples require a hardware OpenGL/WebGL window.';
    syncSize();
    window.onResize.add((_, _) -> syncSize());
  }

  public function getContext(contextId:String, ?attributes:Dynamic):Dynamic {
    return context;
  }

  function syncSize():Void {
    width = Std.int(window.width * window.scale);
    height = Std.int(window.height * window.scale);
  }

  static function resolveContext(window:Window):Dynamic {
    final renderContext:Dynamic = window.context;
    if (renderContext == null) return null;
    final webgl2 = renderContext.webgl2;
    return webgl2 == null ? renderContext.webgl : webgl2;
  }
}

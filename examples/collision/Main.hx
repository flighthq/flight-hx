// Line-by-line Haxe/Lime port of the upstream `collision` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// Pointer drag is Lime's `onMouseDown`/`onMouseMove`/`onMouseUp`. Every other statement is faithful.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.Collision.CollisionAabb;
import flighthq.types.Collision.CollisionCircle;
import flighthq.types.Collision.CollisionManifold;
import flighthq.types.Collision.CollisionPolygon;
import flighthq.types.DisplayObject;
import flighthq.types.Shape;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.Window;

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;

  final CANVAS_WIDTH = 800;
  final CANVAS_HEIGHT = 600;

  final COLOR_IDLE = 0x4488cc;
  final COLOR_COLLIDING = 0xcc4444;
  final COLOR_MTV = 0x44cc44;

  var main:DisplayObject;

  // Scene: two circles, one AABB, one convex polygon (pentagon).
  var colliders:Array<_Collider>;

  // MTV visualization overlay — a single shape redrawn each frame with all active MTV arrows.
  var mtvOverlay:Shape;

  // Pointer drag state.
  var dragTarget:_Collider = null;
  var dragOffsetX = 0.0;
  var dragOffsetY = 0.0;

  var manifold:CollisionManifold;

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
      backgroundColor: 0x1a1a2eff,
      contextAttributes: {alpha: false, preserveDrawingBuffer: true},
      sceneGraphSyncPolicy: 'requiresInvalidation',
    });
    registerDefaultGlMaterial(renderState);
    registerRenderer(renderState, ShapeKind, defaultGlShapeRenderer);
    registerGlShapeCommands(defaultGlShapeCommands);
    enableGlBlendModeSupport(renderState);

    main = createDisplayObject();
    main.scaleX = scale;
    main.scaleY = scale;

    colliders = [
      createCircleCollider(200, 200, 50),
      createCircleCollider(400, 300, 40),
      createAabbCollider(550, 200, 60, 45),
      createPolygonCollider(300, 450, makeRegularPolygonPoints(300, 450, 55, 5)),
    ];

    mtvOverlay = createShape();
    addNodeChild(main, mtvOverlay);

    manifold = createCollisionManifold();

    ready = true;
  }

  function createCircleCollider(x:Float, y:Float, radius:Float):_Collider {
    final shape = createShape();
    addNodeChild(main, shape);
    final c = new _Collider();
    c.kind = 'circle';
    c.collider = ({x: x, y: y, radius: radius} : CollisionCircle);
    c.shape = shape;
    return c;
  }

  function createAabbCollider(centerX:Float, centerY:Float, halfW:Float, halfH:Float):_Collider {
    final shape = createShape();
    addNodeChild(main, shape);
    final c = new _Collider();
    c.kind = 'aabb';
    c.collider = ({minX: centerX - halfW, minY: centerY - halfH, maxX: centerX + halfW, maxY: centerY + halfH} : CollisionAabb);
    c.shape = shape;
    return c;
  }

  function createPolygonCollider(centerX:Float, centerY:Float, points:Array<Float>):_Collider {
    final shape = createShape();
    addNodeChild(main, shape);
    final c = new _Collider();
    c.kind = 'polygon';
    c.collider = ({points: points} : CollisionPolygon);
    c.centerX = centerX;
    c.centerY = centerY;
    c.shape = shape;
    return c;
  }

  function makeRegularPolygonPoints(cx:Float, cy:Float, radius:Float, sides:Int):Array<Float> {
    final points:Array<Float> = [];
    final angleStep = (Math.PI * 2) / sides;
    final startAngle = -Math.PI / 2;
    for (i in 0...sides) {
      final angle = startAngle + angleStep * i;
      points.push(cx + Math.cos(angle) * radius);
      points.push(cy + Math.sin(angle) * radius);
    }
    return points;
  }

  // Returns the center of a collider in world space, used for drag offset and MTV line origin.
  function getColliderCenter(c:_Collider):{x:Float, y:Float} {
    switch (c.kind) {
      case 'circle':
        final col:CollisionCircle = c.collider;
        return {x: col.x, y: col.y};
      case 'aabb':
        final col:CollisionAabb = c.collider;
        return {x: (col.minX + col.maxX) * 0.5, y: (col.minY + col.maxY) * 0.5};
      case 'polygon':
        return {x: c.centerX, y: c.centerY};
    }
    return {x: 0, y: 0};
  }

  function moveCollider(c:_Collider, dx:Float, dy:Float):Void {
    switch (c.kind) {
      case 'circle':
        final col:CollisionCircle = c.collider;
        col.x += dx;
        col.y += dy;
      case 'aabb':
        final col:CollisionAabb = c.collider;
        col.minX += dx;
        col.minY += dy;
        col.maxX += dx;
        col.maxY += dy;
      case 'polygon':
        c.centerX += dx;
        c.centerY += dy;
        final pts:Array<Float> = (c.collider : CollisionPolygon).points;
        var i = 0;
        while (i < pts.length) {
          pts[i] += dx;
          pts[i + 1] += dy;
          i += 2;
        }
    }
  }

  function isPointInsideCollider(c:_Collider, px:Float, py:Float):Bool {
    switch (c.kind) {
      case 'circle':
        final col:CollisionCircle = c.collider;
        final dx = px - col.x;
        final dy = py - col.y;
        return dx * dx + dy * dy <= col.radius * col.radius;
      case 'aabb':
        final col:CollisionAabb = c.collider;
        return px >= col.minX && px <= col.maxX && py >= col.minY && py <= col.maxY;
      case 'polygon':
        // Winding-number point-in-polygon for convex shapes.
        final pts:Array<Float> = (c.collider : CollisionPolygon).points;
        final n = pts.length >> 1;
        var inside = true;
        for (i in 0...n) {
          final j = (i + 1) % n;
          final ex = pts[j * 2] - pts[i * 2];
          final ey = pts[j * 2 + 1] - pts[i * 2 + 1];
          final tx = px - pts[i * 2];
          final ty = py - pts[i * 2 + 1];
          if (ex * ty - ey * tx < 0) {
            inside = false;
            break;
          }
        }
        return inside;
    }
    return false;
  }

  // Test one pair for collision, dispatching on the two kinds.
  function testPairCollision(a:_Collider, b:_Collider, out:CollisionManifold):Bool {
    if (a.kind == 'circle' && b.kind == 'circle') {
      return testCircleCircleCollision(a.collider, b.collider, out);
    }
    if (a.kind == 'circle' && b.kind == 'aabb') {
      return testCircleAabbCollision(a.collider, b.collider, out);
    }
    if (a.kind == 'aabb' && b.kind == 'circle') {
      final result = testCircleAabbCollision(b.collider, a.collider, out);
      if (result) {
        out.normalX = -out.normalX;
        out.normalY = -out.normalY;
      }
      return result;
    }
    if (a.kind == 'aabb' && b.kind == 'aabb') {
      return testAabbAabbCollision(a.collider, b.collider, out);
    }
    if (a.kind == 'circle' && b.kind == 'polygon') {
      return testCirclePolygonCollision(a.collider, b.collider, out);
    }
    if (a.kind == 'polygon' && b.kind == 'circle') {
      final result = testCirclePolygonCollision(b.collider, a.collider, out);
      if (result) {
        out.normalX = -out.normalX;
        out.normalY = -out.normalY;
      }
      return result;
    }
    if (a.kind == 'polygon' && b.kind == 'polygon') {
      return testPolygonPolygonCollision(a.collider, b.collider, out);
    }
    if (a.kind == 'aabb' && b.kind == 'polygon') {
      return testAabbPolygonCollision(a.collider, b.collider, out);
    }
    if (a.kind == 'polygon' && b.kind == 'aabb') {
      final result = testAabbPolygonCollision(b.collider, a.collider, out);
      if (result) {
        out.normalX = -out.normalX;
        out.normalY = -out.normalY;
      }
      return result;
    }
    return false;
  }

  // Redraw one collider's shape with the given fill color.
  function redrawCollider(c:_Collider, color:Int):Void {
    clearShapeCommands(c.shape);
    appendShapeBeginFill(c.shape, color, 0.6);
    appendShapeLineStyle(c.shape, 2, color);

    switch (c.kind) {
      case 'circle':
        final col:CollisionCircle = c.collider;
        appendShapeCircle(c.shape, col.x, col.y, col.radius);
      case 'aabb':
        final col:CollisionAabb = c.collider;
        appendShapeRectangle(c.shape, col.minX, col.minY, col.maxX - col.minX, col.maxY - col.minY);
      case 'polygon':
        final pts:Array<Float> = (c.collider : CollisionPolygon).points;
        appendShapeMoveTo(c.shape, pts[0], pts[1]);
        var i = 2;
        while (i < pts.length) {
          appendShapeLineTo(c.shape, pts[i], pts[i + 1]);
          i += 2;
        }
        appendShapeLineTo(c.shape, pts[0], pts[1]);
    }
    appendShapeEndFill(c.shape);
    invalidateNodeLocalTransform(c.shape);
  }

  // Draw an MTV arrow from a point along the normal with the given depth.
  function drawMtvArrow(shape:Shape, originX:Float, originY:Float, normalX:Float, normalY:Float, depth:Float):Void {
    final endX = originX + normalX * depth;
    final endY = originY + normalY * depth;

    appendShapeLineStyle(shape, 3, COLOR_MTV);
    appendShapeMoveTo(shape, originX, originY);
    appendShapeLineTo(shape, endX, endY);

    // Arrowhead.
    final arrowSize = 8;
    final perpX = -normalY;
    final perpY = normalX;
    appendShapeMoveTo(shape, endX - normalX * arrowSize + perpX * arrowSize * 0.5, endY - normalY * arrowSize + perpY * arrowSize * 0.5);
    appendShapeLineTo(shape, endX, endY);
    appendShapeLineTo(shape, endX - normalX * arrowSize - perpX * arrowSize * 0.5, endY - normalY * arrowSize - perpY * arrowSize * 0.5);
  }

  // Pointer drag. In the browser these are canvas pointer listeners; here they are Lime's mouse events.
  override public function onMouseDown(px:Float, py:Float, button:Int):Void {
    if (!ready) return;
    // Pick the topmost collider under the pointer (iterate in reverse for z-order).
    var i = colliders.length - 1;
    while (i >= 0) {
      if (isPointInsideCollider(colliders[i], px, py)) {
        dragTarget = colliders[i];
        final center = getColliderCenter(dragTarget);
        dragOffsetX = px - center.x;
        dragOffsetY = py - center.y;
        break;
      }
      i--;
    }
  }

  override public function onMouseMove(px:Float, py:Float):Void {
    if (!ready) return;
    if (dragTarget == null) return;
    final center = getColliderCenter(dragTarget);
    final dx = px - dragOffsetX - center.x;
    final dy = py - dragOffsetY - center.y;
    moveCollider(dragTarget, dx, dy);
  }

  override public function onMouseUp(px:Float, py:Float, button:Int):Void {
    dragTarget = null;
  }

  // Upstream `enterFrame`, driven by Lime's per-frame `update`.
  override public function update(deltaTime:Int):Void {
    if (!ready) return;

    // Determine which colliders are involved in at least one overlap.
    final collidingSet = new Map<_Collider, Bool>();
    final manifolds:Array<Dynamic> = [];

    for (i in 0...colliders.length) {
      for (j in (i + 1)...colliders.length) {
        final a = colliders[i];
        final b = colliders[j];
        if (testPairCollision(a, b, manifold)) {
          collidingSet.set(a, true);
          collidingSet.set(b, true);
          final centerA = getColliderCenter(a);
          manifolds.push({
            originX: centerA.x,
            originY: centerA.y,
            normalX: manifold.normalX,
            normalY: manifold.normalY,
            depth: manifold.depth,
          });
        }
      }
    }

    // Redraw each collider with the appropriate color.
    for (c in colliders) {
      redrawCollider(c, collidingSet.exists(c) ? COLOR_COLLIDING : COLOR_IDLE);
    }

    // Redraw the MTV overlay.
    clearShapeCommands(mtvOverlay);
    for (m in manifolds) {
      drawMtvArrow(mtvOverlay, m.originX, m.originY, m.normalX, m.normalY, m.depth * 2);
    }
    invalidateNodeLocalTransform(mtvOverlay);
  }

  // Upstream `render(main)`, driven by Lime's per-frame `render`.
  override public function render(context:RenderContext):Void {
    if (!ready || main == null) return;
    if (!prepareDisplayObjectRender(renderState, main)) return;
    renderGlBackground(renderState);
    renderGlDisplayObject(renderState, main);
  }
}

// A collider record — the union of the upstream `CircleCollider | AabbCollider | PolygonCollider`,
// discriminated by `kind`. `collider` holds the plain-data collider the collision package operates on.
private class _Collider {
  public var kind:String;
  public var collider:Dynamic;
  public var centerX:Float = 0;
  public var centerY:Float = 0;
  public var shape:Shape;

  public function new() {}
}

// Minimal GL canvas adapter over the Lime window, matching the shape `createGlRenderState` expects.
// @:keep — Flight reaches this adapter only reflectively (getContext/width/height via Reflect),
// so full DCE would strip those members and reflective access would crash. Retain the whole adapter.
@:keep
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

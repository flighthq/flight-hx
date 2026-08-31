// Line-by-line Haxe/Lime port of the upstream `video` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flight.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and Flight's Lime host capabilities are enabled with `HostLime.enableHostLime(this)`.
//
// Upstream has two source paths. The MediaRecorder/blob pipeline (`generateVideoBlob` +
// `loadVideoResourceFromBlob` + audio `playVideoResource` channels) needs browser media APIs that no
// Lime target provides, so this port takes upstream's other path — the `__flightCapture` branch —
// on every target: a canvas stands in for the HTMLVideoElement (`videoWidth`/`videoHeight`/
// `readyState` fields plus painted frames from the same `drawVideoFrame` routine). Unlike the
// static capture render, the frames keep animating: each source advances at the playback rate its
// upstream audio channel would have used (0.75/1.0/1.25), so the visible result matches the live
// browser demo — three copies of the clip drifting apart in time.
import flight.hostLime.HostLime;
import flight.Sdk.*;
import flight.types.DisplayObject;
import flight.types.Sprite;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.Window;

#if js
private typedef CaptureContext = Dynamic;
#else
private typedef CaptureContext = flight._internal.backend.NativeCanvas2dContext;
#end

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;
  var usingCairo = false;

  var root:DisplayObject;
  var videoNode:Sprite;
  var secondVideoNode:Sprite;
  var thirdVideoNode:Sprite;

  // One entry per video source: the canvas standing in for the video element, its 2D context, the
  // Flight texture, and the fractional frame clock advancing at that source's playback rate.
  var sources:Array<{element:Dynamic, ctx:Dynamic, texture:Dynamic, frame:Float, rate:Float}> = [];

  public function new() {
    super();
  }

  // Lime: window/GL are ready. Wire the Flight Lime backend, set up the renderer, build the scene.
  override public function onWindowCreate():Void {
    HostLime.enableHostLime(this);
    switch (window.context.type) {
      case CAIRO:
        usingCairo = true;
      case OPENGL, OPENGLES, WEBGL:
      default:
        throw 'Flight examples require an OpenGL/WebGL or cairo render context.';
    }
    scale = window.scale;
    final surfaceCreator = flight.Scene2DCairo.createCairoRenderSurfaceCreator();
    if (usingCairo) {
      final canvas = flight.Scene2DCairo.createCairoSurface(window);
      renderState = createCanvasRenderState(createCanvasRenderSurface(surfaceCreator, canvas, {pixelRatio: window.scale}), scene2dCanvasPipeline, createCanvasTextureResolvers(surfaceCreator), {
        pixelRatio: window.scale,
        backgroundColor: 0x1a1a2eff,
        sceneGraphSyncPolicy: 'requiresInvalidation',
      });
      registerCanvasImageTextureResolver(getCanvasRenderStateTextureResolvers(renderState));
      registerRenderer(renderState, SpriteKind, defaultCanvasSpriteRenderer);
    } else {
      final canvas = flight.hostLime.GlSurface.createGlSurface(window);
      renderState = createGlRenderState(createGlContextState(createGlContextFromCanvasElement(canvas, {contextAttributes: {alpha: false, preserveDrawingBuffer: true}})), scene2dGlPipeline, {
        pixelRatio: window.scale,
        backgroundColor: 0x1a1a2eff,
        sceneGraphSyncPolicy: 'requiresInvalidation',
      });
      registerGlStandardMaterial(renderState);
      registerStandardGlTextureResolvers(renderState);
      registerRenderer(renderState, SpriteKind, defaultGlSpriteRenderer);
    }

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    videoNode = createSprite();
    videoNode.x = 40;
    videoNode.y = 40;
    addNodeChild(root, videoNode);

    secondVideoNode = createSprite();
    secondVideoNode.x = 400;
    secondVideoNode.y = 40;
    secondVideoNode.scaleX = 1.5;
    secondVideoNode.scaleY = 1.5;
    secondVideoNode.alpha = 0.8;
    addNodeChild(root, secondVideoNode);

    thirdVideoNode = createSprite();
    thirdVideoNode.x = 200;
    thirdVideoNode.y = 280;
    thirdVideoNode.rotation = 10;
    addNodeChild(root, thirdVideoNode);

    // Upstream `setVideoSources(createCaptureVideoResource(), ...)`: three independent capture
    // sources, each with the playback rate its `startVideoChannels` counterpart would set.
    final nodes:Array<Sprite> = [videoNode, secondVideoNode, thirdVideoNode];
    for (i in 0...3) {
      final entry = createCaptureVideoSource(0.75 + i * 0.25);
      sources.push(entry);
      nodes[i].data.texture = entry.texture;
    }

    ready = true;
  }

  // Upstream `createCaptureVideoResource`: a canvas masquerading as an HTMLVideoElement.
  function createCaptureVideoSource(rate:Float):{element:Dynamic, ctx:Dynamic, texture:Dynamic, frame:Float, rate:Float} {
    final width = 320;
    final height = 240;
    #if js
    final frame:Dynamic = js.Browser.document.createElement('canvas');
    frame.width = width;
    frame.height = height;
    frame.videoWidth = width;
    frame.videoHeight = height;
    frame.readyState = 2;
    final ctx:Dynamic = frame.getContext('2d');
    #else
    // Typed construction: neko's Dynamic dispatch cannot call class methods reliably, so resolve
    // getContext statically and only hand the frame onward as Dynamic.
    final frameCanvas = new _CaptureVideoFrame();
    frameCanvas.width = width;
    frameCanvas.height = height;
    frameCanvas.videoWidth = width;
    frameCanvas.videoHeight = height;
    final frame:Dynamic = frameCanvas;
    final ctx:CaptureContext = frameCanvas.nativeContext();
    #end
    drawVideoFrame(ctx, width, height, 5);
    final resource = createVideoResource(frame);
    final texture = createVideoTexture(resource);
    return {element: frame, ctx: ctx, texture: texture, frame: 5, rate: rate};
  }

  // Upstream `drawVideoFrame`, with `hsl()` fills converted to `rgb()` (the native canvas backend
  // parses hex and rgb()/rgba() forms only).
  static function drawVideoFrame(ctx:CaptureContext, width:Int, height:Int, frame:Float):Void {
    final hue = (frame * 4) % 360;
    ctx.fillStyle = hslToRgbString(hue, 0.7, 0.3);
    ctx.fillRect(0, 0, width, height);

    ctx.fillStyle = '#ffffff';
    final barX = (frame * 3) % width;
    ctx.fillRect(barX, 60, 30, 120);

    ctx.fillStyle = hslToRgbString((hue + 180) % 360, 0.8, 0.6);
    final circleX = width / 2 + Math.cos(frame * 0.1) * 80;
    final circleY = height / 2 + Math.sin(frame * 0.1) * 40;
    ctx.beginPath();
    ctx.arc(circleX, circleY, 25, 0, Math.PI * 2, false);
    ctx.fill();
  }

  // CSS hsl() equivalent producing an `rgb(r, g, b)` string.
  static function hslToRgbString(hue:Float, saturation:Float, lightness:Float):String {
    final chroma = (1 - Math.abs(2 * lightness - 1)) * saturation;
    final huePrime = hue / 60;
    final x = chroma * (1 - Math.abs(huePrime % 2 - 1));
    var r = 0.0, g = 0.0, b = 0.0;
    if (huePrime < 1) { r = chroma; g = x; }
    else if (huePrime < 2) { r = x; g = chroma; }
    else if (huePrime < 3) { g = chroma; b = x; }
    else if (huePrime < 4) { g = x; b = chroma; }
    else if (huePrime < 5) { r = x; b = chroma; }
    else { r = chroma; b = x; }
    final m = lightness - chroma / 2;
    final red = Math.round((r + m) * 255);
    final green = Math.round((g + m) * 255);
    final blue = Math.round((b + m) * 255);
    return 'rgb($red, $green, $blue)';
  }

  // Upstream `renderFrame`'s advance step, driven by Lime's per-frame `update`: paint the next
  // frame of each capture clip at its playback rate, then bump the video texture version.
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    for (entry in sources) {
      entry.frame += entry.rate;
      drawVideoFrame(cast entry.ctx, 320, 240, entry.frame);
      advanceVideoTexture(entry.texture);
    }
    invalidateNodeAppearance(videoNode);
    invalidateNodeAppearance(secondVideoNode);
    invalidateNodeAppearance(thirdVideoNode);
  }

  // Upstream `render(root)`, driven by Lime's per-frame `render`.
  override public function render(context:RenderContext):Void {
    if (!ready || root == null) return;
    // Nothing changed since the last frame: skip the draw AND cancel this frame's present, so
    // Lime does not flip to the never-drawn back buffer (a black flash every second frame on
    // page-flip hardware). OpenFL's Stage pauses rendering the same way; the skipped frame costs
    // nothing, which matters on the interpreter targets.
    if (!prepareScene2DRender(renderState, root)) {
      window.onRender.cancel();
      return;
    }
    if (usingCairo) {
      renderCanvasBackground(renderState);
      renderCanvasScene2D(renderState, root);
    } else {
      renderGlBackground(renderState);
      renderGlScene2D(renderState, root);
    }
  }
}

#if !js
// Native stand-in for upstream's capture-path canvas-as-video-element: a scratch canvas (which both
// the GL image uploader and the cairo drawImage path accept) carrying the HTMLVideoElement fields
// (`videoWidth`/`videoHeight`/`readyState`) the video texture runtime reads reflectively. They must
// be real fields — hxcpp Reflect.field cannot find expando properties on class instances.
@:keep
private class _CaptureVideoFrame extends flight._internal.backend.NativeScratchCanvas {
  public var videoWidth:Int = 0;
  public var videoHeight:Int = 0;
  public var readyState:Int = 2;

  public function new() {
    super();
  }
}
#end

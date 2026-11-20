package flight;

#if (js && flight_esm)
import flight.AppWindow;
import flight.HostApp.FrameScheduler;
import flight.HostApp.LifecycleCapability;
import flight.HostApp.WindowAttachCapability;
import flight.HostApp.WindowLifecycleCapability;
#end

class HostWeb {
  #if (js && flight_esm)
  public static var frameScheduler(get, never):FrameScheduler;
  static inline function get_frameScheduler():FrameScheduler return HostWebExports.webHostLoop;

  public static var lifecycle(get, never):LifecycleCapability;
  static inline function get_lifecycle():LifecycleCapability return HostWebExports.webHostLifecycle;

  public static var windowAttach(get, never):WindowAttachCapability;
  static inline function get_windowAttach():WindowAttachCapability return HostWebExports.webHostWindowAttach;

  public static var windowLifecycle(get, never):WindowLifecycleCapability;
  static inline function get_windowLifecycle():WindowLifecycleCapability return HostWebExports.webHostWindowLifecycle;

  public static inline function getWindowHandle(win:AppWindow):Null<js.html.Window>
    return HostWebExports.getWebWindowHandle(win);

  public static var canvas(get, never):WebCanvasCapability;
  static inline function get_canvas():WebCanvasCapability return HostWebExports.webHostCanvas;

  public static var gl(get, never):WebGlCapability;
  static inline function get_gl():WebGlCapability return HostWebExports.webHostGl;

  public static var wgpu(get, never):WebWgpuCapability;
  static inline function get_wgpu():WebWgpuCapability return HostWebExports.webHostWgpuContext;

  public static inline function createGlSurfaceFromNativeHandle(capability:WebGlCapability, canvas:js.html.CanvasElement,
      ?options:WebGlOptions):Null<WebGlSurface>
    return options == null ? WebSurfaceExports.createGlSurfaceFromNativeHandle(capability, canvas)
      : WebSurfaceExports.createGlSurfaceFromNativeHandle(capability, canvas, options);

  public static inline function destroyGlSurface(capability:WebGlCapability, surface:WebGlSurface):Void
    WebSurfaceExports.destroyGlSurface(capability, surface);

  public static inline function createWgpuSurfaceFromNativeHandle(capability:WebWgpuCapability, canvas:js.html.CanvasElement,
      ?options:WebWgpuOptions):js.lib.Promise<Null<WebWgpuSurface>>
    return WebSurfaceExports.createWgpuSurfaceFromNativeHandle(capability, canvas, options);

  public static inline function destroyWgpuSurface(capability:WebWgpuCapability, surface:WebWgpuSurface):Void
    WebSurfaceExports.destroyWgpuSurface(capability, surface);

  public static var inputTarget(get, never):WebInputTargetCapability;
  static inline function get_inputTarget():WebInputTargetCapability return HostWebExports.webHostInputTarget;

  public static inline function createInputTargetHandle(element:js.html.Element):WebInputTargetHandle
    return HostWebExports.createWebInputTargetHandle(element);

  public static inline function createCanvasSurfaceFromNativeHandle(capability:WebCanvasCapability, canvas:js.html.CanvasElement,
      ?options:WebCanvasOptions):Null<WebCanvasSurface>
    return WebSurfaceExports.createCanvasSurfaceFromNativeHandle(capability, canvas, options);

  public static inline function destroyCanvasSurface(capability:WebCanvasCapability, surface:WebCanvasSurface):Void
    WebSurfaceExports.destroyCanvasSurface(capability, surface);

  public static inline function getCanvasHandle(surface:WebCanvasSurface):Null<js.html.CanvasElement>
    return HostWebExports.getWebSurfaceCanvasHandle(surface);
  #end
}

#if (js && flight_esm)
abstract WebCanvasCapability(Dynamic) {}
abstract WebCanvasSurface(Dynamic) {}
abstract WebGlCapability(Dynamic) {}
abstract WebGlSurface(Dynamic) {}
abstract WebWgpuCapability(Dynamic) {}
abstract WebWgpuSurface(Dynamic) {}
abstract WebInputTargetHandle(Dynamic) {}

typedef WebGlOptions = {
  ?antialias:Bool,
  ?contextAttributes:js.html.webgl.ContextAttributes,
  ?powerPreference:String,
};

typedef WebWgpuOptions = {
  ?format:String,
  ?powerPreference:String,
};
typedef WebCanvasOptions = {
  ?alpha:Bool,
  ?colorSpace:String,
  ?desynchronized:Bool,
  ?willReadFrequently:Bool,
};

extern class WebInputTargetCapability {
  function prepare(target:WebInputTargetHandle):Void;
}

@:jsRequire("@flighthq/host-web")
private extern class HostWebExports {
  static final webHostLoop:FrameScheduler;
  static final webHostLifecycle:LifecycleCapability;
  static final webHostWindowAttach:WindowAttachCapability;
  static final webHostWindowLifecycle:WindowLifecycleCapability;
  static function getWebWindowHandle(win:AppWindow):Null<js.html.Window>;
  static final webHostCanvas:WebCanvasCapability;
  static final webHostGl:WebGlCapability;
  static final webHostWgpuContext:WebWgpuCapability;
  static final webHostInputTarget:WebInputTargetCapability;
  static function createWebInputTargetHandle(element:js.html.Element):WebInputTargetHandle;
  static function getWebSurfaceCanvasHandle(surface:WebCanvasSurface):Null<js.html.CanvasElement>;
}

@:jsRequire("@flighthq/surface")
private extern class WebSurfaceExports {
  static function createCanvasSurfaceFromNativeHandle(capability:WebCanvasCapability, canvas:js.html.CanvasElement,
    ?options:WebCanvasOptions):Null<WebCanvasSurface>;
  static function destroyCanvasSurface(capability:WebCanvasCapability, surface:WebCanvasSurface):Void;
  static function createGlSurfaceFromNativeHandle(capability:WebGlCapability, canvas:js.html.CanvasElement,
    ?options:WebGlOptions):Null<WebGlSurface>;
  static function destroyGlSurface(capability:WebGlCapability, surface:WebGlSurface):Void;
  static function createWgpuSurfaceFromNativeHandle(capability:WebWgpuCapability, canvas:js.html.CanvasElement,
    ?options:WebWgpuOptions):js.lib.Promise<Null<WebWgpuSurface>>;
  static function destroyWgpuSurface(capability:WebWgpuCapability, surface:WebWgpuSurface):Void;
}
#end

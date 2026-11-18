package flight;

class HostWeb {
  #if (js && flight_esm)
  public static var canvas(get, never):WebCanvasCapability;
  static inline function get_canvas():WebCanvasCapability return HostWebExports.webHostCanvas;

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
abstract WebInputTargetHandle(Dynamic) {}
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
  static final webHostCanvas:WebCanvasCapability;
  static final webHostInputTarget:WebInputTargetCapability;
  static function createWebInputTargetHandle(element:js.html.Element):WebInputTargetHandle;
  static function getWebSurfaceCanvasHandle(surface:WebCanvasSurface):Null<js.html.CanvasElement>;
}

@:jsRequire("@flighthq/surface")
private extern class WebSurfaceExports {
  static function createCanvasSurfaceFromNativeHandle(capability:WebCanvasCapability, canvas:js.html.CanvasElement,
    ?options:WebCanvasOptions):Null<WebCanvasSurface>;
  static function destroyCanvasSurface(capability:WebCanvasCapability, surface:WebCanvasSurface):Void;
}
#end

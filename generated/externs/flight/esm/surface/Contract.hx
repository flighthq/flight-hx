package flight.esm.surface;

#if (js && flight_esm)
@:jsRequire("@flighthq/surface/contract")
extern class Contract {
  public static function allocateSurface<T>(handle:Dynamic):flight.esm.types.entity_contract.Types.EntityConstruction<T>;
  public static function attachWindowRenderState(hostSurfaceResize:flight.esm.types.surface.Types.HostSurfaceResizeCapability, win:flight.esm.types.app.Types.AppWindow, surface:flight.esm.types.surface.Types.Surface):Void;
  public static function createCanvasSurface(capability:flight.esm.types.surface.Types.HostCanvasCapability, window:flight.esm.types.app.Types.AppWindow, width:Float, height:Float, ?options:Dynamic):Null<flight.esm.types.surface.Types.CanvasSurface>;
  public static function createCanvasSurfaceFromNativeHandle(capability:flight.esm.types.surface.Types.HostCanvasCapability, handle:Dynamic, ?options:Dynamic):Null<flight.esm.types.surface.Types.CanvasSurface>;
  public static function createGlSurface<Context, Options>(capability:flight.esm.types.surface.Types.HostSurfaceContextCapability<Context, Options>, window:flight.esm.types.app.Types.AppWindow, width:Float, height:Float, ?options:Null<Options>):Dynamic;
  public static function createGlSurfaceFromNativeHandle<Context, Options>(capability:flight.esm.types.surface.Types.HostSurfaceContextCapability<Context, Options>, handle:Dynamic, ?options:Null<Options>):Dynamic;
  public static function createWgpuSurface<Acquisition, Options>(capability:flight.esm.types.surface.Types.HostWgpuSurfaceCapability<Acquisition, Options>, window:flight.esm.types.app.Types.AppWindow, width:Float, height:Float, ?options:Dynamic):js.lib.Promise<Dynamic>;
  public static function createWgpuSurfaceFromNativeHandle<Acquisition, Options>(capability:flight.esm.types.surface.Types.HostWgpuSurfaceCapability<Acquisition, Options>, handle:Dynamic, ?options:Dynamic):js.lib.Promise<Dynamic>;
  public static function destroyCanvasSurface(capability:flight.esm.types.surface.Types.HostCanvasCapability, surface:flight.esm.types.surface.Types.CanvasSurface):Void;
  public static function destroyGlSurface<Context, Options>(capability:flight.esm.types.surface.Types.HostSurfaceContextCapability<Context, Options>, surface:Dynamic):Void;
  public static function destroyWgpuSurface<Acquisition, Options>(capability:flight.esm.types.surface.Types.HostWgpuSurfaceCapability<Acquisition, Options>, surface:Dynamic):Void;
  public static function detachWindowRenderState(win:flight.esm.types.app.Types.AppWindow):Void;
  public static function getSurfaceHandle(surface:flight.esm.types.surface.Types.Surface):Dynamic;
  public static function getSurfaceRuntime(surface:flight.esm.types.surface.Types.Surface):flight.esm.types.surface.Types.SurfaceRuntime;
  public static function resizeSurface(capability:flight.esm.types.surface.Types.HostSurfaceResizeCapability, surface:flight.esm.types.surface.Types.Surface, width:Float, height:Float):Void;
  public static function setSurfaceDisplaySize(capability:flight.esm.types.surface.Types.HostSurfaceDisplayCapability, surface:flight.esm.types.surface.Types.Surface, width:Float, height:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

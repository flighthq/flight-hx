package flight._js._fn;

@:jsRequire("@flighthq/surface")
extern class Surface {
	@:native("createCanvasSurface")
	public static function createCanvasSurface(capability:flight._js.HostCanvasCapability, window:Dynamic, width:Float, height:Float, options:Null<flight._js.CanvasRenderingContext2DSettings>):Null<Dynamic>;
	@:native("destroyCanvasSurface")
	public static function destroyCanvasSurface(capability:flight._js.HostCanvasCapability, surface:Dynamic):Void;
	@:native("resizeSurface")
	public static function resizeSurface(capability:flight._js.HostSurfaceResizeCapability, surface:flight._js.SurfaceRef, width:Float, height:Float):Void;
	@:native("setSurfaceDisplaySize")
	public static function setSurfaceDisplaySize(capability:flight._js.HostSurfaceDisplayCapability, surface:flight._js.SurfaceRef, width:Float, height:Float):Void;
	@:native("attachWindowRenderState")
	public static function attachWindowRenderState(hostSurfaceResize:flight._js.HostSurfaceResizeCapability, win:Dynamic, surface:flight._js.SurfaceRef):Void;
	@:native("detachWindowRenderState")
	public static function detachWindowRenderState(win:Dynamic):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCanvasSurfaceRef(ptr:flight._js.CanvasSurface):Void {}
}

package flight._cpp._fn;

extern class Surface {
	@:native("flight_create_canvas_surface")
	public static function createCanvasSurface(capability:flight._cpp.HostCanvasCapability, window:cpp.Star<cpp.Void>, width:Float, height:Float, options:flight._cpp.CanvasRenderingContext2DSettings):cpp.Star<cpp.Void>;
	@:native("flight_destroy_canvas_surface")
	public static function destroyCanvasSurface(capability:flight._cpp.HostCanvasCapability, surface:cpp.Star<cpp.Void>):Void;
	@:native("flight_resize_surface")
	public static function resizeSurface(capability:flight._cpp.HostSurfaceResizeCapability, surface:flight._cpp.SurfaceRef, width:Single, height:Single):Void;
	@:native("flight_set_surface_display_size")
	public static function setSurfaceDisplaySize(capability:flight._cpp.HostSurfaceDisplayCapability, surface:flight._cpp.SurfaceRef, width:Single, height:Single):Void;
	@:native("flight_attach_window_render_state")
	public static function attachWindowRenderState(hostSurfaceResize:flight._cpp.HostSurfaceResizeCapability, win:cpp.Star<cpp.Void>, surface:flight._cpp.SurfaceRef):Void;
	@:native("flight_detach_window_render_state")
	public static function detachWindowRenderState(win:cpp.Star<cpp.Void>):Void;
	@:native("flight_free_canvas_surface_ref")
	public static function freeCanvasSurfaceRef(ptr:flight._cpp.CanvasSurface):Void;
}

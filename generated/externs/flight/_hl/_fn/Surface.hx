package flight._hl._fn;

extern class Surface {
	@:hlNative("flight", "flight_create_canvas_surface")
	public static function createCanvasSurface(capability:flight._hl.HostCanvasCapability, window:hl.Bytes, width:Float, height:Float, options:flight._hl.CanvasRenderingContext2DSettings):hl.Bytes;
	@:hlNative("flight", "flight_destroy_canvas_surface")
	public static function destroyCanvasSurface(capability:flight._hl.HostCanvasCapability, surface:hl.Bytes):Void;
	@:hlNative("flight", "flight_resize_surface")
	public static function resizeSurface(capability:flight._hl.HostSurfaceResizeCapability, surface:flight._hl.SurfaceRef, width:Single, height:Single):Void;
	@:hlNative("flight", "flight_set_surface_display_size")
	public static function setSurfaceDisplaySize(capability:flight._hl.HostSurfaceDisplayCapability, surface:flight._hl.SurfaceRef, width:Single, height:Single):Void;
	@:hlNative("flight", "flight_attach_window_render_state")
	public static function attachWindowRenderState(hostSurfaceResize:flight._hl.HostSurfaceResizeCapability, win:hl.Bytes, surface:flight._hl.SurfaceRef):Void;
	@:hlNative("flight", "flight_detach_window_render_state")
	public static function detachWindowRenderState(win:hl.Bytes):Void;
	@:hlNative("flight", "flight_free_canvas_surface_ref")
	public static function freeCanvasSurfaceRef(ptr:flight._hl.CanvasSurface):Void;
}

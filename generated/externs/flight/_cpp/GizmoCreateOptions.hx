package flight._cpp;

private extern class GizmoCreateOptions_Ffi {
	@:native("flight_get_gizmo_create_options_viewport_height") static function get_viewportHeight(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gizmo_create_options_viewport_height") static function set_viewportHeight(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_gizmo_create_options_viewport_width") static function get_viewportWidth(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gizmo_create_options_viewport_width") static function set_viewportWidth(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract GizmoCreateOptions(cpp.Star<cpp.Void>) {
	public var viewportHeight(get, set):Float;

	inline function get_viewportHeight():Float return GizmoCreateOptions_Ffi.get_viewportHeight(this);

	inline function set_viewportHeight(value:Float):Float { GizmoCreateOptions_Ffi.set_viewportHeight(this, value); return value; }
	public var viewportWidth(get, set):Float;

	inline function get_viewportWidth():Float return GizmoCreateOptions_Ffi.get_viewportWidth(this);

	inline function set_viewportWidth(value:Float):Float { GizmoCreateOptions_Ffi.set_viewportWidth(this, value); return value; }
}

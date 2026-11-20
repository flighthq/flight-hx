package flight._cpp;

private extern class GizmoSmartGuideResult_Ffi {
	@:native("flight_get_gizmo_smart_guide_result_delta_x") static function get_deltaX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gizmo_smart_guide_result_delta_x") static function set_deltaX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_gizmo_smart_guide_result_delta_y") static function get_deltaY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gizmo_smart_guide_result_delta_y") static function set_deltaY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract GizmoSmartGuideResult(cpp.Star<cpp.Void>) {
	public var deltaX(get, set):Float;

	inline function get_deltaX():Float return GizmoSmartGuideResult_Ffi.get_deltaX(this);

	inline function set_deltaX(value:Float):Float { GizmoSmartGuideResult_Ffi.set_deltaX(this, value); return value; }
	public var deltaY(get, set):Float;

	inline function get_deltaY():Float return GizmoSmartGuideResult_Ffi.get_deltaY(this);

	inline function set_deltaY(value:Float):Float { GizmoSmartGuideResult_Ffi.set_deltaY(this, value); return value; }
}

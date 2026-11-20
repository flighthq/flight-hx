package flight._cpp;

private extern class EffectCaptureGeometry_Ffi {
	@:native("flight_get_effect_capture_geometry_target_height") static function get_targetHeight(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_effect_capture_geometry_target_height") static function set_targetHeight(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_effect_capture_geometry_target_width") static function get_targetWidth(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_effect_capture_geometry_target_width") static function set_targetWidth(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract EffectCaptureGeometry(cpp.Star<cpp.Void>) {
	public var targetHeight(get, set):Float;

	inline function get_targetHeight():Float return EffectCaptureGeometry_Ffi.get_targetHeight(this);

	inline function set_targetHeight(value:Float):Float { EffectCaptureGeometry_Ffi.set_targetHeight(this, value); return value; }
	public var targetWidth(get, set):Float;

	inline function get_targetWidth():Float return EffectCaptureGeometry_Ffi.get_targetWidth(this);

	inline function set_targetWidth(value:Float):Float { EffectCaptureGeometry_Ffi.set_targetWidth(this, value); return value; }
}

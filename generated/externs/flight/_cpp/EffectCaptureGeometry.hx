package flight._cpp;

private extern class EffectCaptureGeometry_Ffi {
	@:native("flight_get_effect_capture_geometry_target_height") static function get_targetHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_effect_capture_geometry_target_height") static function set_targetHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_effect_capture_geometry_target_width") static function get_targetWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_effect_capture_geometry_target_width") static function set_targetWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract EffectCaptureGeometry(cpp.Star<cpp.Void>) {
	public var targetHeight(get, set):Single;

	inline function get_targetHeight():Single return EffectCaptureGeometry_Ffi.get_targetHeight(this);

	inline function set_targetHeight(value:Single):Single { EffectCaptureGeometry_Ffi.set_targetHeight(this, value); return value; }
	public var targetWidth(get, set):Single;

	inline function get_targetWidth():Single return EffectCaptureGeometry_Ffi.get_targetWidth(this);

	inline function set_targetWidth(value:Single):Single { EffectCaptureGeometry_Ffi.set_targetWidth(this, value); return value; }
}

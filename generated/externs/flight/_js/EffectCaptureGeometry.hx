package flight._js;

@:jsRequire("flight")
private extern class EffectCaptureGeometry_Ffi {
	@:native("flight_get_effect_capture_geometry_target_height") static function get_targetHeight(ptr:Dynamic):Float;
	@:native("flight_set_effect_capture_geometry_target_height") static function set_targetHeight(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_effect_capture_geometry_target_width") static function get_targetWidth(ptr:Dynamic):Float;
	@:native("flight_set_effect_capture_geometry_target_width") static function set_targetWidth(ptr:Dynamic, value:Float):Float;
}

abstract EffectCaptureGeometry(Dynamic) {
	public var targetHeight(get, set):Float;

	inline function get_targetHeight():Float return EffectCaptureGeometry_Ffi.get_targetHeight(this);

	inline function set_targetHeight(value:Float):Float return EffectCaptureGeometry_Ffi.set_targetHeight(this, value);
	public var targetWidth(get, set):Float;

	inline function get_targetWidth():Float return EffectCaptureGeometry_Ffi.get_targetWidth(this);

	inline function set_targetWidth(value:Float):Float return EffectCaptureGeometry_Ffi.set_targetWidth(this, value);
}

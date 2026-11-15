package flight._js;

@:jsRequire("flight")
private extern class Camera3DViewExplanation_Ffi {
	@:native("flight_get_camera3_dview_explanation_determinant") static function get_determinant(ptr:Dynamic):Float;
	@:native("flight_set_camera3_dview_explanation_determinant") static function set_determinant(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_camera3_dview_explanation_is_orthonormal") static function get_isOrthonormal(ptr:Dynamic):Bool;
	@:native("flight_set_camera3_dview_explanation_is_orthonormal") static function set_isOrthonormal(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_camera3_dview_explanation_is_reflection") static function get_isReflection(ptr:Dynamic):Bool;
	@:native("flight_set_camera3_dview_explanation_is_reflection") static function set_isReflection(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_camera3_dview_explanation_scale_deviation") static function get_scaleDeviation(ptr:Dynamic):Float;
	@:native("flight_set_camera3_dview_explanation_scale_deviation") static function set_scaleDeviation(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_camera3_dview_explanation_shear_deviation") static function get_shearDeviation(ptr:Dynamic):Float;
	@:native("flight_set_camera3_dview_explanation_shear_deviation") static function set_shearDeviation(ptr:Dynamic, value:Float):Float;
}

abstract Camera3DViewExplanation(Dynamic) {
	public var determinant(get, set):Float;

	inline function get_determinant():Float return Camera3DViewExplanation_Ffi.get_determinant(this);

	inline function set_determinant(value:Float):Float return Camera3DViewExplanation_Ffi.set_determinant(this, value);
	public var isOrthonormal(get, set):Bool;

	inline function get_isOrthonormal():Bool return Camera3DViewExplanation_Ffi.get_isOrthonormal(this);

	inline function set_isOrthonormal(value:Bool):Bool return Camera3DViewExplanation_Ffi.set_isOrthonormal(this, value);
	public var isReflection(get, set):Bool;

	inline function get_isReflection():Bool return Camera3DViewExplanation_Ffi.get_isReflection(this);

	inline function set_isReflection(value:Bool):Bool return Camera3DViewExplanation_Ffi.set_isReflection(this, value);
	public var scaleDeviation(get, set):Float;

	inline function get_scaleDeviation():Float return Camera3DViewExplanation_Ffi.get_scaleDeviation(this);

	inline function set_scaleDeviation(value:Float):Float return Camera3DViewExplanation_Ffi.set_scaleDeviation(this, value);
	public var shearDeviation(get, set):Float;

	inline function get_shearDeviation():Float return Camera3DViewExplanation_Ffi.get_shearDeviation(this);

	inline function set_shearDeviation(value:Float):Float return Camera3DViewExplanation_Ffi.set_shearDeviation(this, value);
}

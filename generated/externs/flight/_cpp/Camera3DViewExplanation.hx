package flight._cpp;

private extern class Camera3DViewExplanation_Ffi {
	@:native("flight_get_camera3_dview_explanation_determinant") static function get_determinant(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_camera3_dview_explanation_determinant") static function set_determinant(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_camera3_dview_explanation_is_orthonormal") static function get_isOrthonormal(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_camera3_dview_explanation_is_orthonormal") static function set_isOrthonormal(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_camera3_dview_explanation_is_reflection") static function get_isReflection(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_camera3_dview_explanation_is_reflection") static function set_isReflection(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_camera3_dview_explanation_scale_deviation") static function get_scaleDeviation(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_camera3_dview_explanation_scale_deviation") static function set_scaleDeviation(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_camera3_dview_explanation_shear_deviation") static function get_shearDeviation(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_camera3_dview_explanation_shear_deviation") static function set_shearDeviation(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Camera3DViewExplanation(cpp.Star<cpp.Void>) {
	public var determinant(get, set):Single;

	inline function get_determinant():Single return Camera3DViewExplanation_Ffi.get_determinant(this);

	inline function set_determinant(value:Single):Single return Camera3DViewExplanation_Ffi.set_determinant(this, value);
	public var isOrthonormal(get, set):Bool;

	inline function get_isOrthonormal():Bool return Camera3DViewExplanation_Ffi.get_isOrthonormal(this);

	inline function set_isOrthonormal(value:Bool):Bool return Camera3DViewExplanation_Ffi.set_isOrthonormal(this, value);
	public var isReflection(get, set):Bool;

	inline function get_isReflection():Bool return Camera3DViewExplanation_Ffi.get_isReflection(this);

	inline function set_isReflection(value:Bool):Bool return Camera3DViewExplanation_Ffi.set_isReflection(this, value);
	public var scaleDeviation(get, set):Single;

	inline function get_scaleDeviation():Single return Camera3DViewExplanation_Ffi.get_scaleDeviation(this);

	inline function set_scaleDeviation(value:Single):Single return Camera3DViewExplanation_Ffi.set_scaleDeviation(this, value);
	public var shearDeviation(get, set):Single;

	inline function get_shearDeviation():Single return Camera3DViewExplanation_Ffi.get_shearDeviation(this);

	inline function set_shearDeviation(value:Single):Single return Camera3DViewExplanation_Ffi.set_shearDeviation(this, value);
}

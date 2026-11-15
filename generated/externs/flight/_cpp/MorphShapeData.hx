package flight._cpp;

private extern class MorphShapeData_Ffi {
	@:native("flight_get_morph_shape_data_progress") static function get_progress(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_morph_shape_data_progress") static function set_progress(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract MorphShapeData(cpp.Star<cpp.Void>) {
	public var progress(get, set):Float;

	inline function get_progress():Float return MorphShapeData_Ffi.get_progress(this);

	inline function set_progress(value:Float):Float return MorphShapeData_Ffi.set_progress(this, value);
}

package flight._js;

@:jsRequire("flight")
private extern class MorphShapeData_Ffi {
	@:native("flight_get_morph_shape_data_progress") static function get_progress(ptr:Dynamic):Float;
	@:native("flight_set_morph_shape_data_progress") static function set_progress(ptr:Dynamic, value:Float):Float;
}

abstract MorphShapeData(Dynamic) {
	public var progress(get, set):Float;

	inline function get_progress():Float return MorphShapeData_Ffi.get_progress(this);

	inline function set_progress(value:Float):Float return MorphShapeData_Ffi.set_progress(this, value);
}

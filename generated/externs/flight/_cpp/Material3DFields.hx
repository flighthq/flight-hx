package flight._cpp;

private extern class Material3DFields_Ffi {
	@:native("flight_get_material3_dfields_alpha_cutoff") static function get_alphaCutoff(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_material3_dfields_alpha_cutoff") static function set_alphaCutoff(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_material3_dfields_double_sided") static function get_doubleSided(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_material3_dfields_double_sided") static function set_doubleSided(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Material3DFields(cpp.Star<cpp.Void>) {
	public var alphaCutoff(get, set):Single;

	inline function get_alphaCutoff():Single return Material3DFields_Ffi.get_alphaCutoff(this);

	inline function set_alphaCutoff(value:Single):Single { Material3DFields_Ffi.set_alphaCutoff(this, value); return value; }
	public var doubleSided(get, set):Bool;

	inline function get_doubleSided():Bool return Material3DFields_Ffi.get_doubleSided(this);

	inline function set_doubleSided(value:Bool):Bool { Material3DFields_Ffi.set_doubleSided(this, value); return value; }
}

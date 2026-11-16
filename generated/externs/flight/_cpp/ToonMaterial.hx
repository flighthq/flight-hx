package flight._cpp;

private extern class ToonMaterial_Ffi {
	@:native("flight_get_toon_material_base_color") static function get_baseColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_toon_material_base_color") static function set_baseColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_toon_material_steps") static function get_steps(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_toon_material_steps") static function set_steps(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ToonMaterial(cpp.Star<cpp.Void>) {
	public var baseColor(get, set):Int;

	inline function get_baseColor():Int return ToonMaterial_Ffi.get_baseColor(this);

	inline function set_baseColor(value:Int):Int { ToonMaterial_Ffi.set_baseColor(this, value); return value; }
	public var steps(get, set):Int;

	inline function get_steps():Int return ToonMaterial_Ffi.get_steps(this);

	inline function set_steps(value:Int):Int { ToonMaterial_Ffi.set_steps(this, value); return value; }
}

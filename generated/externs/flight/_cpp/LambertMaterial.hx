package flight._cpp;

private extern class LambertMaterial_Ffi {
	@:native("flight_get_lambert_material_diffuse") static function get_diffuse(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_lambert_material_diffuse") static function set_diffuse(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_lambert_material_emissive") static function get_emissive(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_lambert_material_emissive") static function set_emissive(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract LambertMaterial(cpp.Star<cpp.Void>) {
	public var diffuse(get, set):Int;

	inline function get_diffuse():Int return LambertMaterial_Ffi.get_diffuse(this);

	inline function set_diffuse(value:Int):Int { LambertMaterial_Ffi.set_diffuse(this, value); return value; }
	public var emissive(get, set):Int;

	inline function get_emissive():Int return LambertMaterial_Ffi.get_emissive(this);

	inline function set_emissive(value:Int):Int { LambertMaterial_Ffi.set_emissive(this, value); return value; }
}

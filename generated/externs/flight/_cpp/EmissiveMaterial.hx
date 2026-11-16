package flight._cpp;

private extern class EmissiveMaterial_Ffi {
	@:native("flight_get_emissive_material_emissive") static function get_emissive(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_emissive_material_emissive") static function set_emissive(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_emissive_material_emissive_strength") static function get_emissiveStrength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_emissive_material_emissive_strength") static function set_emissiveStrength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract EmissiveMaterial(cpp.Star<cpp.Void>) {
	public var emissive(get, set):Int;

	inline function get_emissive():Int return EmissiveMaterial_Ffi.get_emissive(this);

	inline function set_emissive(value:Int):Int { EmissiveMaterial_Ffi.set_emissive(this, value); return value; }
	public var emissiveStrength(get, set):Single;

	inline function get_emissiveStrength():Single return EmissiveMaterial_Ffi.get_emissiveStrength(this);

	inline function set_emissiveStrength(value:Single):Single { EmissiveMaterial_Ffi.set_emissiveStrength(this, value); return value; }
}

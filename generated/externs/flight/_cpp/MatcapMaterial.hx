package flight._cpp;

private extern class MatcapMaterial_Ffi {
	@:native("flight_get_matcap_material_tint") static function get_tint(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_matcap_material_tint") static function set_tint(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract MatcapMaterial(cpp.Star<cpp.Void>) {
	public var tint(get, set):Int;

	inline function get_tint():Int return MatcapMaterial_Ffi.get_tint(this);

	inline function set_tint(value:Int):Int { MatcapMaterial_Ffi.set_tint(this, value); return value; }
}

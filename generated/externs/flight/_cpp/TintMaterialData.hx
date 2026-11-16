package flight._cpp;

private extern class TintMaterialData_Ffi {
	@:native("flight_get_tint_material_data_tint") static function get_tint(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_tint_material_data_tint") static function set_tint(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TintMaterialData(cpp.Star<cpp.Void>) {
	public var tint(get, set):Int;

	inline function get_tint():Int return TintMaterialData_Ffi.get_tint(this);

	inline function set_tint(value:Int):Int { TintMaterialData_Ffi.set_tint(this, value); return value; }
}

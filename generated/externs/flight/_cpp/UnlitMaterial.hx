package flight._cpp;

private extern class UnlitMaterial_Ffi {
	@:native("flight_get_unlit_material_base_color") static function get_baseColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_unlit_material_base_color") static function set_baseColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract UnlitMaterial(cpp.Star<cpp.Void>) {
	public var baseColor(get, set):Int;

	inline function get_baseColor():Int return UnlitMaterial_Ffi.get_baseColor(this);

	inline function set_baseColor(value:Int):Int { UnlitMaterial_Ffi.set_baseColor(this, value); return value; }
}

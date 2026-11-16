package flight._cpp;

private extern class NormalMaterial_Ffi {
	@:native("flight_get_normal_material_normal_scale") static function get_normalScale(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_normal_material_normal_scale") static function set_normalScale(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract NormalMaterial(cpp.Star<cpp.Void>) {
	public var normalScale(get, set):Single;

	inline function get_normalScale():Single return NormalMaterial_Ffi.get_normalScale(this);

	inline function set_normalScale(value:Single):Single { NormalMaterial_Ffi.set_normalScale(this, value); return value; }
}

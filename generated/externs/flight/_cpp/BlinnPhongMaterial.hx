package flight._cpp;

private extern class BlinnPhongMaterial_Ffi {
	@:native("flight_get_blinn_phong_material_diffuse") static function get_diffuse(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_blinn_phong_material_diffuse") static function set_diffuse(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_blinn_phong_material_normal_scale") static function get_normalScale(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_blinn_phong_material_normal_scale") static function set_normalScale(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_blinn_phong_material_shininess") static function get_shininess(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_blinn_phong_material_shininess") static function set_shininess(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_blinn_phong_material_specular") static function get_specular(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_blinn_phong_material_specular") static function set_specular(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract BlinnPhongMaterial(cpp.Star<cpp.Void>) {
	public var diffuse(get, set):Int;

	inline function get_diffuse():Int return BlinnPhongMaterial_Ffi.get_diffuse(this);

	inline function set_diffuse(value:Int):Int { BlinnPhongMaterial_Ffi.set_diffuse(this, value); return value; }
	public var normalScale(get, set):Single;

	inline function get_normalScale():Single return BlinnPhongMaterial_Ffi.get_normalScale(this);

	inline function set_normalScale(value:Single):Single { BlinnPhongMaterial_Ffi.set_normalScale(this, value); return value; }
	public var shininess(get, set):Single;

	inline function get_shininess():Single return BlinnPhongMaterial_Ffi.get_shininess(this);

	inline function set_shininess(value:Single):Single { BlinnPhongMaterial_Ffi.set_shininess(this, value); return value; }
	public var specular(get, set):Int;

	inline function get_specular():Int return BlinnPhongMaterial_Ffi.get_specular(this);

	inline function set_specular(value:Int):Int { BlinnPhongMaterial_Ffi.set_specular(this, value); return value; }
}

package flight._cpp;

private extern class StandardPbrMaterial_Ffi {
	@:native("flight_get_standard_pbr_material_base_color") static function get_baseColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_standard_pbr_material_base_color") static function set_baseColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_standard_pbr_material_emissive") static function get_emissive(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_standard_pbr_material_emissive") static function set_emissive(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_standard_pbr_material_emissive_strength") static function get_emissiveStrength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_standard_pbr_material_emissive_strength") static function set_emissiveStrength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_standard_pbr_material_metallic") static function get_metallic(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_standard_pbr_material_metallic") static function set_metallic(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_standard_pbr_material_normal_scale") static function get_normalScale(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_standard_pbr_material_normal_scale") static function set_normalScale(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_standard_pbr_material_occlusion_strength") static function get_occlusionStrength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_standard_pbr_material_occlusion_strength") static function set_occlusionStrength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_standard_pbr_material_roughness") static function get_roughness(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_standard_pbr_material_roughness") static function set_roughness(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract StandardPbrMaterial(cpp.Star<cpp.Void>) {
	public var baseColor(get, set):Int;

	inline function get_baseColor():Int return StandardPbrMaterial_Ffi.get_baseColor(this);

	inline function set_baseColor(value:Int):Int { StandardPbrMaterial_Ffi.set_baseColor(this, value); return value; }
	public var emissive(get, set):Int;

	inline function get_emissive():Int return StandardPbrMaterial_Ffi.get_emissive(this);

	inline function set_emissive(value:Int):Int { StandardPbrMaterial_Ffi.set_emissive(this, value); return value; }
	public var emissiveStrength(get, set):Single;

	inline function get_emissiveStrength():Single return StandardPbrMaterial_Ffi.get_emissiveStrength(this);

	inline function set_emissiveStrength(value:Single):Single { StandardPbrMaterial_Ffi.set_emissiveStrength(this, value); return value; }
	public var metallic(get, set):Single;

	inline function get_metallic():Single return StandardPbrMaterial_Ffi.get_metallic(this);

	inline function set_metallic(value:Single):Single { StandardPbrMaterial_Ffi.set_metallic(this, value); return value; }
	public var normalScale(get, set):Single;

	inline function get_normalScale():Single return StandardPbrMaterial_Ffi.get_normalScale(this);

	inline function set_normalScale(value:Single):Single { StandardPbrMaterial_Ffi.set_normalScale(this, value); return value; }
	public var occlusionStrength(get, set):Single;

	inline function get_occlusionStrength():Single return StandardPbrMaterial_Ffi.get_occlusionStrength(this);

	inline function set_occlusionStrength(value:Single):Single { StandardPbrMaterial_Ffi.set_occlusionStrength(this, value); return value; }
	public var roughness(get, set):Single;

	inline function get_roughness():Single return StandardPbrMaterial_Ffi.get_roughness(this);

	inline function set_roughness(value:Single):Single { StandardPbrMaterial_Ffi.set_roughness(this, value); return value; }
}

package flight._cpp;

private extern class SpecularGlossinessPbrMaterial_Ffi {
	@:native("flight_get_specular_glossiness_pbr_material_diffuse") static function get_diffuse(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_specular_glossiness_pbr_material_diffuse") static function set_diffuse(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_specular_glossiness_pbr_material_emissive") static function get_emissive(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_specular_glossiness_pbr_material_emissive") static function set_emissive(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_specular_glossiness_pbr_material_emissive_strength") static function get_emissiveStrength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_specular_glossiness_pbr_material_emissive_strength") static function set_emissiveStrength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_specular_glossiness_pbr_material_glossiness") static function get_glossiness(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_specular_glossiness_pbr_material_glossiness") static function set_glossiness(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_specular_glossiness_pbr_material_normal_scale") static function get_normalScale(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_specular_glossiness_pbr_material_normal_scale") static function set_normalScale(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_specular_glossiness_pbr_material_occlusion_strength") static function get_occlusionStrength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_specular_glossiness_pbr_material_occlusion_strength") static function set_occlusionStrength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_specular_glossiness_pbr_material_specular") static function get_specular(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_specular_glossiness_pbr_material_specular") static function set_specular(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract SpecularGlossinessPbrMaterial(cpp.Star<cpp.Void>) {
	public var diffuse(get, set):Int;

	inline function get_diffuse():Int return SpecularGlossinessPbrMaterial_Ffi.get_diffuse(this);

	inline function set_diffuse(value:Int):Int { SpecularGlossinessPbrMaterial_Ffi.set_diffuse(this, value); return value; }
	public var emissive(get, set):Int;

	inline function get_emissive():Int return SpecularGlossinessPbrMaterial_Ffi.get_emissive(this);

	inline function set_emissive(value:Int):Int { SpecularGlossinessPbrMaterial_Ffi.set_emissive(this, value); return value; }
	public var emissiveStrength(get, set):Single;

	inline function get_emissiveStrength():Single return SpecularGlossinessPbrMaterial_Ffi.get_emissiveStrength(this);

	inline function set_emissiveStrength(value:Single):Single { SpecularGlossinessPbrMaterial_Ffi.set_emissiveStrength(this, value); return value; }
	public var glossiness(get, set):Single;

	inline function get_glossiness():Single return SpecularGlossinessPbrMaterial_Ffi.get_glossiness(this);

	inline function set_glossiness(value:Single):Single { SpecularGlossinessPbrMaterial_Ffi.set_glossiness(this, value); return value; }
	public var normalScale(get, set):Single;

	inline function get_normalScale():Single return SpecularGlossinessPbrMaterial_Ffi.get_normalScale(this);

	inline function set_normalScale(value:Single):Single { SpecularGlossinessPbrMaterial_Ffi.set_normalScale(this, value); return value; }
	public var occlusionStrength(get, set):Single;

	inline function get_occlusionStrength():Single return SpecularGlossinessPbrMaterial_Ffi.get_occlusionStrength(this);

	inline function set_occlusionStrength(value:Single):Single { SpecularGlossinessPbrMaterial_Ffi.set_occlusionStrength(this, value); return value; }
	public var specular(get, set):Int;

	inline function get_specular():Int return SpecularGlossinessPbrMaterial_Ffi.get_specular(this);

	inline function set_specular(value:Int):Int { SpecularGlossinessPbrMaterial_Ffi.set_specular(this, value); return value; }
}

package flight._js;

@:jsRequire("flight")
private extern class ShadedMaterial_Ffi {
	@:native("flight_get_shaded_material_diffuse") static function get_diffuse(ptr:Dynamic):Int;
	@:native("flight_set_shaded_material_diffuse") static function set_diffuse(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_shaded_material_normal_scale") static function get_normalScale(ptr:Dynamic):Float;
	@:native("flight_set_shaded_material_normal_scale") static function set_normalScale(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_shaded_material_shininess") static function get_shininess(ptr:Dynamic):Float;
	@:native("flight_set_shaded_material_shininess") static function set_shininess(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_shaded_material_specular") static function get_specular(ptr:Dynamic):Int;
	@:native("flight_set_shaded_material_specular") static function set_specular(ptr:Dynamic, value:Int):Int;
}

abstract ShadedMaterial(Dynamic) {
	public var diffuse(get, set):Int;

	inline function get_diffuse():Int return ShadedMaterial_Ffi.get_diffuse(this);

	inline function set_diffuse(value:Int):Int return ShadedMaterial_Ffi.set_diffuse(this, value);
	public var normalScale(get, set):Float;

	inline function get_normalScale():Float return ShadedMaterial_Ffi.get_normalScale(this);

	inline function set_normalScale(value:Float):Float return ShadedMaterial_Ffi.set_normalScale(this, value);
	public var shininess(get, set):Float;

	inline function get_shininess():Float return ShadedMaterial_Ffi.get_shininess(this);

	inline function set_shininess(value:Float):Float return ShadedMaterial_Ffi.set_shininess(this, value);
	public var specular(get, set):Int;

	inline function get_specular():Int return ShadedMaterial_Ffi.get_specular(this);

	inline function set_specular(value:Int):Int return ShadedMaterial_Ffi.set_specular(this, value);
}

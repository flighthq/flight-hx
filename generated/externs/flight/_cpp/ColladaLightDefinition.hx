package flight._cpp;

private extern class ColladaLightDefinition_Ffi {
	@:native("flight_get_collada_light_definition_color") static function get_color(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_collada_light_definition_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_collada_light_definition_decay") static function get_decay(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collada_light_definition_decay") static function set_decay(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collada_light_definition_inner_cone_degrees") static function get_innerConeDegrees(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collada_light_definition_inner_cone_degrees") static function set_innerConeDegrees(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collada_light_definition_intensity") static function get_intensity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collada_light_definition_intensity") static function set_intensity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collada_light_definition_outer_cone_degrees") static function get_outerConeDegrees(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collada_light_definition_outer_cone_degrees") static function set_outerConeDegrees(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_collada_light_definition_spot_blend") static function get_spotBlend(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collada_light_definition_spot_blend") static function set_spotBlend(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ColladaLightDefinition(cpp.Star<cpp.Void>) {
	public var color(get, set):Int;

	inline function get_color():Int return ColladaLightDefinition_Ffi.get_color(this);

	inline function set_color(value:Int):Int { ColladaLightDefinition_Ffi.set_color(this, value); return value; }
	public var decay(get, set):Single;

	inline function get_decay():Single return ColladaLightDefinition_Ffi.get_decay(this);

	inline function set_decay(value:Single):Single { ColladaLightDefinition_Ffi.set_decay(this, value); return value; }
	public var innerConeDegrees(get, set):Single;

	inline function get_innerConeDegrees():Single return ColladaLightDefinition_Ffi.get_innerConeDegrees(this);

	inline function set_innerConeDegrees(value:Single):Single { ColladaLightDefinition_Ffi.set_innerConeDegrees(this, value); return value; }
	public var intensity(get, set):Single;

	inline function get_intensity():Single return ColladaLightDefinition_Ffi.get_intensity(this);

	inline function set_intensity(value:Single):Single { ColladaLightDefinition_Ffi.set_intensity(this, value); return value; }
	public var outerConeDegrees(get, set):Single;

	inline function get_outerConeDegrees():Single return ColladaLightDefinition_Ffi.get_outerConeDegrees(this);

	inline function set_outerConeDegrees(value:Single):Single { ColladaLightDefinition_Ffi.set_outerConeDegrees(this, value); return value; }
	public var spotBlend(get, set):Single;

	inline function get_spotBlend():Single return ColladaLightDefinition_Ffi.get_spotBlend(this);

	inline function set_spotBlend(value:Single):Single { ColladaLightDefinition_Ffi.set_spotBlend(this, value); return value; }
}

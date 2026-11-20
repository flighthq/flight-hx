package flight._cpp;

private extern class Awd2ParsedLight_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_awd2_parsed_light_ambient") static function get_ambient(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_awd2_parsed_light_ambient") static function set_ambient(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_awd2_parsed_light_ambient_rgb") static function get_ambientRgb(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_light_ambient_rgb") static function set_ambientRgb(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_parsed_light_casts_shadow") static function get_castsShadow(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_awd2_parsed_light_casts_shadow") static function set_castsShadow(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_awd2_parsed_light_diffuse") static function get_diffuse(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_awd2_parsed_light_diffuse") static function set_diffuse(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_awd2_parsed_light_direction_x") static function get_directionX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_awd2_parsed_light_direction_x") static function set_directionX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_awd2_parsed_light_direction_y") static function get_directionY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_awd2_parsed_light_direction_y") static function set_directionY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_awd2_parsed_light_direction_z") static function get_directionZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_awd2_parsed_light_direction_z") static function set_directionZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_awd2_parsed_light_fall_off") static function get_fallOff(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_awd2_parsed_light_fall_off") static function set_fallOff(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_awd2_parsed_light_has_radius") static function get_hasRadius(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_awd2_parsed_light_has_radius") static function set_hasRadius(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_awd2_parsed_light_light_type") static function get_lightType(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_light_light_type") static function set_lightType(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_awd2_parsed_light_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_awd2_parsed_light_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_awd2_parsed_light_parent_id") static function get_parentId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_light_parent_id") static function set_parentId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_parsed_light_radius") static function get_radius(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_awd2_parsed_light_radius") static function set_radius(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_awd2_parsed_light_rgb") static function get_rgb(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_light_rgb") static function set_rgb(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_parsed_light_specular") static function get_specular(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_awd2_parsed_light_specular") static function set_specular(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Awd2ParsedLight(cpp.Star<cpp.Void>) {
	public var ambient(get, set):Float;

	inline function get_ambient():Float return Awd2ParsedLight_Ffi.get_ambient(this);

	inline function set_ambient(value:Float):Float { Awd2ParsedLight_Ffi.set_ambient(this, value); return value; }
	public var ambientRgb(get, set):Int;

	inline function get_ambientRgb():Int return Awd2ParsedLight_Ffi.get_ambientRgb(this);

	inline function set_ambientRgb(value:Int):Int { Awd2ParsedLight_Ffi.set_ambientRgb(this, value); return value; }
	public var castsShadow(get, set):Bool;

	inline function get_castsShadow():Bool return Awd2ParsedLight_Ffi.get_castsShadow(this);

	inline function set_castsShadow(value:Bool):Bool { Awd2ParsedLight_Ffi.set_castsShadow(this, value); return value; }
	public var diffuse(get, set):Float;

	inline function get_diffuse():Float return Awd2ParsedLight_Ffi.get_diffuse(this);

	inline function set_diffuse(value:Float):Float { Awd2ParsedLight_Ffi.set_diffuse(this, value); return value; }
	public var directionX(get, set):Float;

	inline function get_directionX():Float return Awd2ParsedLight_Ffi.get_directionX(this);

	inline function set_directionX(value:Float):Float { Awd2ParsedLight_Ffi.set_directionX(this, value); return value; }
	public var directionY(get, set):Float;

	inline function get_directionY():Float return Awd2ParsedLight_Ffi.get_directionY(this);

	inline function set_directionY(value:Float):Float { Awd2ParsedLight_Ffi.set_directionY(this, value); return value; }
	public var directionZ(get, set):Float;

	inline function get_directionZ():Float return Awd2ParsedLight_Ffi.get_directionZ(this);

	inline function set_directionZ(value:Float):Float { Awd2ParsedLight_Ffi.set_directionZ(this, value); return value; }
	public var fallOff(get, set):Float;

	inline function get_fallOff():Float return Awd2ParsedLight_Ffi.get_fallOff(this);

	inline function set_fallOff(value:Float):Float { Awd2ParsedLight_Ffi.set_fallOff(this, value); return value; }
	public var hasRadius(get, set):Bool;

	inline function get_hasRadius():Bool return Awd2ParsedLight_Ffi.get_hasRadius(this);

	inline function set_hasRadius(value:Bool):Bool { Awd2ParsedLight_Ffi.set_hasRadius(this, value); return value; }
	public var lightType(get, set):Int;

	inline function get_lightType():Int return Awd2ParsedLight_Ffi.get_lightType(this);

	inline function set_lightType(value:Int):Int { Awd2ParsedLight_Ffi.set_lightType(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = Awd2ParsedLight_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Awd2ParsedLight_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; Awd2ParsedLight_Ffi.set_name(this, raw); return value; }
	public var parentId(get, set):Int;

	inline function get_parentId():Int return Awd2ParsedLight_Ffi.get_parentId(this);

	inline function set_parentId(value:Int):Int { Awd2ParsedLight_Ffi.set_parentId(this, value); return value; }
	public var radius(get, set):Float;

	inline function get_radius():Float return Awd2ParsedLight_Ffi.get_radius(this);

	inline function set_radius(value:Float):Float { Awd2ParsedLight_Ffi.set_radius(this, value); return value; }
	public var rgb(get, set):Int;

	inline function get_rgb():Int return Awd2ParsedLight_Ffi.get_rgb(this);

	inline function set_rgb(value:Int):Int { Awd2ParsedLight_Ffi.set_rgb(this, value); return value; }
	public var specular(get, set):Float;

	inline function get_specular():Float return Awd2ParsedLight_Ffi.get_specular(this);

	inline function set_specular(value:Float):Float { Awd2ParsedLight_Ffi.set_specular(this, value); return value; }
}

package flight._cpp;

private extern class Awd2ParsedLight_Ffi {
	@:native("flight_get_awd2_parsed_light_ambient") static function get_ambient(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_awd2_parsed_light_ambient") static function set_ambient(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_awd2_parsed_light_ambient_rgb") static function get_ambientRgb(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_light_ambient_rgb") static function set_ambientRgb(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_parsed_light_casts_shadow") static function get_castsShadow(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_awd2_parsed_light_casts_shadow") static function set_castsShadow(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_awd2_parsed_light_diffuse") static function get_diffuse(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_awd2_parsed_light_diffuse") static function set_diffuse(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_awd2_parsed_light_direction_x") static function get_directionX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_awd2_parsed_light_direction_x") static function set_directionX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_awd2_parsed_light_direction_y") static function get_directionY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_awd2_parsed_light_direction_y") static function set_directionY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_awd2_parsed_light_direction_z") static function get_directionZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_awd2_parsed_light_direction_z") static function set_directionZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_awd2_parsed_light_fall_off") static function get_fallOff(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_awd2_parsed_light_fall_off") static function set_fallOff(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_awd2_parsed_light_has_radius") static function get_hasRadius(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_awd2_parsed_light_has_radius") static function set_hasRadius(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_awd2_parsed_light_light_type") static function get_lightType(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_light_light_type") static function set_lightType(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_awd2_parsed_light_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_awd2_parsed_light_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_awd2_parsed_light_parent_id") static function get_parentId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_light_parent_id") static function set_parentId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_parsed_light_radius") static function get_radius(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_awd2_parsed_light_radius") static function set_radius(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_awd2_parsed_light_rgb") static function get_rgb(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_light_rgb") static function set_rgb(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_parsed_light_specular") static function get_specular(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_awd2_parsed_light_specular") static function set_specular(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Awd2ParsedLight(cpp.Star<cpp.Void>) {
	public var ambient(get, set):Single;

	inline function get_ambient():Single return Awd2ParsedLight_Ffi.get_ambient(this);

	inline function set_ambient(value:Single):Single { Awd2ParsedLight_Ffi.set_ambient(this, value); return value; }
	public var ambientRgb(get, set):Int;

	inline function get_ambientRgb():Int return Awd2ParsedLight_Ffi.get_ambientRgb(this);

	inline function set_ambientRgb(value:Int):Int { Awd2ParsedLight_Ffi.set_ambientRgb(this, value); return value; }
	public var castsShadow(get, set):Bool;

	inline function get_castsShadow():Bool return Awd2ParsedLight_Ffi.get_castsShadow(this);

	inline function set_castsShadow(value:Bool):Bool { Awd2ParsedLight_Ffi.set_castsShadow(this, value); return value; }
	public var diffuse(get, set):Single;

	inline function get_diffuse():Single return Awd2ParsedLight_Ffi.get_diffuse(this);

	inline function set_diffuse(value:Single):Single { Awd2ParsedLight_Ffi.set_diffuse(this, value); return value; }
	public var directionX(get, set):Single;

	inline function get_directionX():Single return Awd2ParsedLight_Ffi.get_directionX(this);

	inline function set_directionX(value:Single):Single { Awd2ParsedLight_Ffi.set_directionX(this, value); return value; }
	public var directionY(get, set):Single;

	inline function get_directionY():Single return Awd2ParsedLight_Ffi.get_directionY(this);

	inline function set_directionY(value:Single):Single { Awd2ParsedLight_Ffi.set_directionY(this, value); return value; }
	public var directionZ(get, set):Single;

	inline function get_directionZ():Single return Awd2ParsedLight_Ffi.get_directionZ(this);

	inline function set_directionZ(value:Single):Single { Awd2ParsedLight_Ffi.set_directionZ(this, value); return value; }
	public var fallOff(get, set):Single;

	inline function get_fallOff():Single return Awd2ParsedLight_Ffi.get_fallOff(this);

	inline function set_fallOff(value:Single):Single { Awd2ParsedLight_Ffi.set_fallOff(this, value); return value; }
	public var hasRadius(get, set):Bool;

	inline function get_hasRadius():Bool return Awd2ParsedLight_Ffi.get_hasRadius(this);

	inline function set_hasRadius(value:Bool):Bool { Awd2ParsedLight_Ffi.set_hasRadius(this, value); return value; }
	public var lightType(get, set):Int;

	inline function get_lightType():Int return Awd2ParsedLight_Ffi.get_lightType(this);

	inline function set_lightType(value:Int):Int { Awd2ParsedLight_Ffi.set_lightType(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = Awd2ParsedLight_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Awd2ParsedLight_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var parentId(get, set):Int;

	inline function get_parentId():Int return Awd2ParsedLight_Ffi.get_parentId(this);

	inline function set_parentId(value:Int):Int { Awd2ParsedLight_Ffi.set_parentId(this, value); return value; }
	public var radius(get, set):Single;

	inline function get_radius():Single return Awd2ParsedLight_Ffi.get_radius(this);

	inline function set_radius(value:Single):Single { Awd2ParsedLight_Ffi.set_radius(this, value); return value; }
	public var rgb(get, set):Int;

	inline function get_rgb():Int return Awd2ParsedLight_Ffi.get_rgb(this);

	inline function set_rgb(value:Int):Int { Awd2ParsedLight_Ffi.set_rgb(this, value); return value; }
	public var specular(get, set):Single;

	inline function get_specular():Single return Awd2ParsedLight_Ffi.get_specular(this);

	inline function set_specular(value:Single):Single { Awd2ParsedLight_Ffi.set_specular(this, value); return value; }
}

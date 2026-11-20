package flight._cpp;

private extern class StarlingSubTexture_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_starling_sub_texture_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_starling_sub_texture_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_starling_sub_texture_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_starling_sub_texture_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_starling_sub_texture_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_starling_sub_texture_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_starling_sub_texture_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_starling_sub_texture_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_starling_sub_texture_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_starling_sub_texture_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract StarlingSubTexture(cpp.Star<cpp.Void>) {
	public var height(get, set):Single;

	inline function get_height():Single return StarlingSubTexture_Ffi.get_height(this);

	inline function set_height(value:Single):Single { StarlingSubTexture_Ffi.set_height(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = StarlingSubTexture_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); StarlingSubTexture_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; StarlingSubTexture_Ffi.set_name(this, raw); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return StarlingSubTexture_Ffi.get_width(this);

	inline function set_width(value:Single):Single { StarlingSubTexture_Ffi.set_width(this, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return StarlingSubTexture_Ffi.get_x(this);

	inline function set_x(value:Single):Single { StarlingSubTexture_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return StarlingSubTexture_Ffi.get_y(this);

	inline function set_y(value:Single):Single { StarlingSubTexture_Ffi.set_y(this, value); return value; }
}

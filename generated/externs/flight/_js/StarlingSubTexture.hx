package flight._js;

@:jsRequire("flight")
private extern class StarlingSubTexture_Ffi {
	@:native("flight_get_starling_sub_texture_height") static function get_height(ptr:Dynamic):Float;
	@:native("flight_set_starling_sub_texture_height") static function set_height(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_starling_sub_texture_width") static function get_width(ptr:Dynamic):Float;
	@:native("flight_set_starling_sub_texture_width") static function set_width(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_starling_sub_texture_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_starling_sub_texture_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_starling_sub_texture_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_starling_sub_texture_y") static function set_y(ptr:Dynamic, value:Float):Float;
}

abstract StarlingSubTexture(Dynamic) {
	public var height(get, set):Float;

	inline function get_height():Float return StarlingSubTexture_Ffi.get_height(this);

	inline function set_height(value:Float):Float return StarlingSubTexture_Ffi.set_height(this, value);
	public var width(get, set):Float;

	inline function get_width():Float return StarlingSubTexture_Ffi.get_width(this);

	inline function set_width(value:Float):Float return StarlingSubTexture_Ffi.set_width(this, value);
	public var x(get, set):Float;

	inline function get_x():Float return StarlingSubTexture_Ffi.get_x(this);

	inline function set_x(value:Float):Float return StarlingSubTexture_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return StarlingSubTexture_Ffi.get_y(this);

	inline function set_y(value:Float):Float return StarlingSubTexture_Ffi.set_y(this, value);
}

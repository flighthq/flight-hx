package flight._js;

@:jsRequire("flight")
private extern class HasAppearance_Ffi {
	@:native("flight_get_has_appearance_alpha") static function get_alpha(ptr:Dynamic):Float;
	@:native("flight_set_has_appearance_alpha") static function set_alpha(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_has_appearance_visible") static function get_visible(ptr:Dynamic):Bool;
	@:native("flight_set_has_appearance_visible") static function set_visible(ptr:Dynamic, value:Bool):Bool;
}

abstract HasAppearance(Dynamic) {
	public var alpha(get, set):Float;

	inline function get_alpha():Float return HasAppearance_Ffi.get_alpha(this);

	inline function set_alpha(value:Float):Float return HasAppearance_Ffi.set_alpha(this, value);
	public var visible(get, set):Bool;

	inline function get_visible():Bool return HasAppearance_Ffi.get_visible(this);

	inline function set_visible(value:Bool):Bool return HasAppearance_Ffi.set_visible(this, value);
}

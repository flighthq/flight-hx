package flight._js;

@:jsRequire("flight")
private extern class RiveProperty_Ffi {
	@:native("flight_get_rive_property_key") static function get_key(ptr:Dynamic):haxe.Int64;
	@:native("flight_set_rive_property_key") static function set_key(ptr:Dynamic, value:haxe.Int64):haxe.Int64;
}

abstract RiveProperty(Dynamic) {
	public var key(get, set):haxe.Int64;

	inline function get_key():haxe.Int64 return RiveProperty_Ffi.get_key(this);

	inline function set_key(value:haxe.Int64):haxe.Int64 return RiveProperty_Ffi.set_key(this, value);
}

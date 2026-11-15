package flight._js;

@:jsRequire("flight")
private extern class AsepriteLayer_Ffi {
	@:native("flight_get_aseprite_layer_opacity") static function get_opacity(ptr:Dynamic):Float;
	@:native("flight_set_aseprite_layer_opacity") static function set_opacity(ptr:Dynamic, value:Float):Float;
}

abstract AsepriteLayer(Dynamic) {
	public var opacity(get, set):Float;

	inline function get_opacity():Float return AsepriteLayer_Ffi.get_opacity(this);

	inline function set_opacity(value:Float):Float return AsepriteLayer_Ffi.set_opacity(this, value);
}

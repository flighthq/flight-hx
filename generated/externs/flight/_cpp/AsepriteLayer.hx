package flight._cpp;

private extern class AsepriteLayer_Ffi {
	@:native("flight_get_aseprite_layer_opacity") static function get_opacity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_aseprite_layer_opacity") static function set_opacity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract AsepriteLayer(cpp.Star<cpp.Void>) {
	public var opacity(get, set):Single;

	inline function get_opacity():Single return AsepriteLayer_Ffi.get_opacity(this);

	inline function set_opacity(value:Single):Single return AsepriteLayer_Ffi.set_opacity(this, value);
}

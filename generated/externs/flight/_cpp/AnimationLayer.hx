package flight._cpp;

private extern class AnimationLayer_Ffi {
	@:native("flight_get_animation_layer_additive") static function get_additive(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_animation_layer_additive") static function set_additive(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_animation_layer_weight") static function get_weight(ptr:cpp.Star<cpp.Void>):Single;
}

abstract AnimationLayer(cpp.Star<cpp.Void>) {
	public var additive(get, set):Bool;

	inline function get_additive():Bool return AnimationLayer_Ffi.get_additive(this);

	inline function set_additive(value:Bool):Bool { AnimationLayer_Ffi.set_additive(this, value); return value; }
	public var weight(get, never):Single;

	inline function get_weight():Single return AnimationLayer_Ffi.get_weight(this);
}

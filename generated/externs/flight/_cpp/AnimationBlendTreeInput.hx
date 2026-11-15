package flight._cpp;

private extern class AnimationBlendTreeInput_Ffi {
	@:native("flight_get_animation_blend_tree_input_additive") static function get_additive(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_animation_blend_tree_input_additive") static function set_additive(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract AnimationBlendTreeInput(cpp.Star<cpp.Void>) {
	public var additive(get, set):Bool;

	inline function get_additive():Bool return AnimationBlendTreeInput_Ffi.get_additive(this);

	inline function set_additive(value:Bool):Bool return AnimationBlendTreeInput_Ffi.set_additive(this, value);
}

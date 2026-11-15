package flight._js;

@:jsRequire("flight")
private extern class AnimationBlendTreeInput_Ffi {
	@:native("flight_get_animation_blend_tree_input_additive") static function get_additive(ptr:Dynamic):Bool;
	@:native("flight_set_animation_blend_tree_input_additive") static function set_additive(ptr:Dynamic, value:Bool):Bool;
}

abstract AnimationBlendTreeInput(Dynamic) {
	public var additive(get, set):Bool;

	inline function get_additive():Bool return AnimationBlendTreeInput_Ffi.get_additive(this);

	inline function set_additive(value:Bool):Bool return AnimationBlendTreeInput_Ffi.set_additive(this, value);
}

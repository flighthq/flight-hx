package flight._js;

@:jsRequire("flight")
private extern class AnimationBlendTreeInput_Ffi {
	@:native("flight_get_animation_blend_tree_input_additive") static function get_additive(ptr:Dynamic):Bool;
	@:native("flight_set_animation_blend_tree_input_additive") static function set_additive(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_animation_blend_tree_input_weight") static function get_weight(ptr:Dynamic):Float;
	@:native("flight_set_animation_blend_tree_input_weight") static function set_weight(ptr:Dynamic, value:Float):Float;
}

abstract AnimationBlendTreeInput(Dynamic) {
	public var additive(get, set):Bool;

	inline function get_additive():Bool return AnimationBlendTreeInput_Ffi.get_additive(this);

	inline function set_additive(value:Bool):Bool return AnimationBlendTreeInput_Ffi.set_additive(this, value);
	public var weight(get, set):Float;

	inline function get_weight():Float return AnimationBlendTreeInput_Ffi.get_weight(this);

	inline function set_weight(value:Float):Float return AnimationBlendTreeInput_Ffi.set_weight(this, value);
}

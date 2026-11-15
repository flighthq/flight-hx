package flight._js;

@:jsRequire("flight")
private extern class AnimationBlendTreeChannelSource_Ffi {
	@:native("flight_get_animation_blend_tree_channel_source_channel_index") static function get_channelIndex(ptr:Dynamic):Int;
	@:native("flight_set_animation_blend_tree_channel_source_channel_index") static function set_channelIndex(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_animation_blend_tree_channel_source_input_index") static function get_inputIndex(ptr:Dynamic):Int;
	@:native("flight_set_animation_blend_tree_channel_source_input_index") static function set_inputIndex(ptr:Dynamic, value:Int):Int;
}

abstract AnimationBlendTreeChannelSource(Dynamic) {
	public var channelIndex(get, set):Int;

	inline function get_channelIndex():Int return AnimationBlendTreeChannelSource_Ffi.get_channelIndex(this);

	inline function set_channelIndex(value:Int):Int return AnimationBlendTreeChannelSource_Ffi.set_channelIndex(this, value);
	public var inputIndex(get, set):Int;

	inline function get_inputIndex():Int return AnimationBlendTreeChannelSource_Ffi.get_inputIndex(this);

	inline function set_inputIndex(value:Int):Int return AnimationBlendTreeChannelSource_Ffi.set_inputIndex(this, value);
}

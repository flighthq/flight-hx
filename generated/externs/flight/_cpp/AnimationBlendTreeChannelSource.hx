package flight._cpp;

private extern class AnimationBlendTreeChannelSource_Ffi {
	@:native("flight_get_animation_blend_tree_channel_source_channel_index") static function get_channelIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_animation_blend_tree_channel_source_channel_index") static function set_channelIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_animation_blend_tree_channel_source_input_index") static function get_inputIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_animation_blend_tree_channel_source_input_index") static function set_inputIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract AnimationBlendTreeChannelSource(cpp.Star<cpp.Void>) {
	public var channelIndex(get, set):Int;

	inline function get_channelIndex():Int return AnimationBlendTreeChannelSource_Ffi.get_channelIndex(this);

	inline function set_channelIndex(value:Int):Int return AnimationBlendTreeChannelSource_Ffi.set_channelIndex(this, value);
	public var inputIndex(get, set):Int;

	inline function get_inputIndex():Int return AnimationBlendTreeChannelSource_Ffi.get_inputIndex(this);

	inline function set_inputIndex(value:Int):Int return AnimationBlendTreeChannelSource_Ffi.set_inputIndex(this, value);
}

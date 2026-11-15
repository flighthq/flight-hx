package flight._js;

@:jsRequire("flight")
private extern class AnimationLayerStackChannelSource_Ffi {
	@:native("flight_get_animation_layer_stack_channel_source_channel_index") static function get_channelIndex(ptr:Dynamic):Int;
	@:native("flight_set_animation_layer_stack_channel_source_channel_index") static function set_channelIndex(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_animation_layer_stack_channel_source_layer_index") static function get_layerIndex(ptr:Dynamic):Int;
	@:native("flight_set_animation_layer_stack_channel_source_layer_index") static function set_layerIndex(ptr:Dynamic, value:Int):Int;
}

abstract AnimationLayerStackChannelSource(Dynamic) {
	public var channelIndex(get, set):Int;

	inline function get_channelIndex():Int return AnimationLayerStackChannelSource_Ffi.get_channelIndex(this);

	inline function set_channelIndex(value:Int):Int return AnimationLayerStackChannelSource_Ffi.set_channelIndex(this, value);
	public var layerIndex(get, set):Int;

	inline function get_layerIndex():Int return AnimationLayerStackChannelSource_Ffi.get_layerIndex(this);

	inline function set_layerIndex(value:Int):Int return AnimationLayerStackChannelSource_Ffi.set_layerIndex(this, value);
}

package flight._js;

abstract AnimationLayerStackChannelSource(Dynamic) {
	public var channelIndex(get, set):Int;
	inline function get_channelIndex():Int return untyped this.channelIndex;
	inline function set_channelIndex(value:Int):Int return untyped this.channelIndex = value;
	public var layerIndex(get, set):Int;
	inline function get_layerIndex():Int return untyped this.layerIndex;
	inline function set_layerIndex(value:Int):Int return untyped this.layerIndex = value;
}

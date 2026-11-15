package flight._hl;

abstract AnimationLayerStackChannelSource(hl.Bytes) {
	public var channelIndex(get, set):Int;

	inline function get_channelIndex():Int return this.getI32(0);

	inline function set_channelIndex(value:Int):Int { this.setI32(0, value); return value; }
	public var layerIndex(get, set):Int;

	inline function get_layerIndex():Int return this.getI32(8);

	inline function set_layerIndex(value:Int):Int { this.setI32(8, value); return value; }
}

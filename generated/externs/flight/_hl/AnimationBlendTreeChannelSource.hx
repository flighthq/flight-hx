package flight._hl;

abstract AnimationBlendTreeChannelSource(hl.Bytes) {
	public var channelIndex(get, set):Int;

	inline function get_channelIndex():Int return this.getI32(0);

	inline function set_channelIndex(value:Int):Int { this.setI32(0, value); return value; }
	public var inputIndex(get, set):Int;

	inline function get_inputIndex():Int return this.getI32(8);

	inline function set_inputIndex(value:Int):Int { this.setI32(8, value); return value; }
}

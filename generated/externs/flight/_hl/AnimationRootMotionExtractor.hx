package flight._hl;

abstract AnimationRootMotionExtractor(hl.Bytes) {
	public var channelIndex(get, set):Int;

	inline function get_channelIndex():Int return this.getI32(40);

	inline function set_channelIndex(value:Int):Int { this.setI32(40, value); return value; }
}

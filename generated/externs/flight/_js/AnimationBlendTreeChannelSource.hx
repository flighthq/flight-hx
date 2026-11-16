package flight._js;

abstract AnimationBlendTreeChannelSource(Dynamic) {
	public var channelIndex(get, set):Int;
	inline function get_channelIndex():Int return untyped this["channelIndex"];
	inline function set_channelIndex(value:Int):Int return untyped this["channelIndex"] = value;
	public var inputIndex(get, set):Int;
	inline function get_inputIndex():Int return untyped this["inputIndex"];
	inline function set_inputIndex(value:Int):Int return untyped this["inputIndex"] = value;
}

package flight._js;

abstract AudioMixer(Dynamic) {
	public var masterGain(get, set):Float;
	inline function get_masterGain():Float return untyped this.masterGain;
	inline function set_masterGain(value:Float):Float return untyped this.masterGain = value;
	public var masterMuted(get, set):Bool;
	inline function get_masterMuted():Bool return untyped this.masterMuted;
	inline function set_masterMuted(value:Bool):Bool return untyped this.masterMuted = value;
}

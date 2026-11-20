package flight._js;

abstract AudioBus(Dynamic) {
	public var gain(get, set):Float;
	inline function get_gain():Float return untyped this.gain;
	inline function set_gain(value:Float):Float return untyped this.gain = value;
	public var muted(get, set):Bool;
	inline function get_muted():Bool return untyped this.muted;
	inline function set_muted(value:Bool):Bool return untyped this.muted = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
	public var pan(get, set):Float;
	inline function get_pan():Float return untyped this.pan;
	inline function set_pan(value:Float):Float return untyped this.pan = value;
}

package flight._js;

abstract SpineParticleDocument(Dynamic) {
	public var continuous(get, set):Bool;
	inline function get_continuous():Bool return untyped this.continuous;
	inline function set_continuous(value:Bool):Bool return untyped this.continuous = value;
	public var duration(get, set):Float;
	inline function get_duration():Float return untyped this.duration;
	inline function set_duration(value:Float):Float return untyped this.duration = value;
	public var maxParticles(get, set):Float;
	inline function get_maxParticles():Float return untyped this.maxParticles;
	inline function set_maxParticles(value:Float):Float return untyped this.maxParticles = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
	public var premultiplied(get, set):Bool;
	inline function get_premultiplied():Bool return untyped this.premultiplied;
	inline function set_premultiplied(value:Bool):Bool return untyped this.premultiplied = value;
}

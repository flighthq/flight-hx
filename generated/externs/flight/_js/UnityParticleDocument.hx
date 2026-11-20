package flight._js;

abstract UnityParticleDocument(Dynamic) {
	public var duration(get, set):Float;
	inline function get_duration():Float return untyped this.duration;
	inline function set_duration(value:Float):Float return untyped this.duration = value;
	public var gravityModifier(get, set):Float;
	inline function get_gravityModifier():Float return untyped this.gravityModifier;
	inline function set_gravityModifier(value:Float):Float return untyped this.gravityModifier = value;
	public var looping(get, set):Bool;
	inline function get_looping():Bool return untyped this.looping;
	inline function set_looping(value:Bool):Bool return untyped this.looping = value;
	public var maxParticles(get, set):Float;
	inline function get_maxParticles():Float return untyped this.maxParticles;
	inline function set_maxParticles(value:Float):Float return untyped this.maxParticles = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
	public var physicsGravity(get, set):Float;
	inline function get_physicsGravity():Float return untyped this.physicsGravity;
	inline function set_physicsGravity(value:Float):Float return untyped this.physicsGravity = value;
	public var prewarm(get, set):Bool;
	inline function get_prewarm():Bool return untyped this.prewarm;
	inline function set_prewarm(value:Bool):Bool return untyped this.prewarm = value;
}

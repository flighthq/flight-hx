package flight._js;

abstract ParticleEmitterData(Dynamic) {
	public var particleCount(get, set):Int;
	inline function get_particleCount():Int return untyped this.particleCount;
	inline function set_particleCount(value:Int):Int return untyped this.particleCount = value;
	public var worldSpace(get, set):Bool;
	inline function get_worldSpace():Bool return untyped this.worldSpace;
	inline function set_worldSpace(value:Bool):Bool return untyped this.worldSpace = value;
}

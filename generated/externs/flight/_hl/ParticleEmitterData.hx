package flight._hl;

abstract ParticleEmitterData(hl.Bytes) {
	public var particleCount(get, set):Int;

	inline function get_particleCount():Int return this.getI32(96);

	inline function set_particleCount(value:Int):Int { this.setI32(96, value); return value; }
	public var worldSpace(get, set):Bool;

	inline function get_worldSpace():Bool return this.getUI8(176) != 0;

	inline function set_worldSpace(value:Bool):Bool { this.setUI8(176, value ? 1 : 0); return value; }
}

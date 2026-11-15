package flight._hl;

abstract SpineParticleDocument(hl.Bytes) {
	public var continuous(get, set):Bool;

	inline function get_continuous():Bool return this.getUI8(36) != 0;

	inline function set_continuous(value:Bool):Bool { this.setUI8(36, value ? 1 : 0); return value; }
	public var duration(get, set):Single;

	inline function get_duration():Single return this.getF32(40);

	inline function set_duration(value:Single):Single { this.setF32(40, value); return value; }
	public var maxParticles(get, set):Single;

	inline function get_maxParticles():Single return this.getF32(104);

	inline function set_maxParticles(value:Single):Single { this.setF32(104, value); return value; }
	public var premultiplied(get, set):Bool;

	inline function get_premultiplied():Bool return this.getUI8(136) != 0;

	inline function set_premultiplied(value:Bool):Bool { this.setUI8(136, value ? 1 : 0); return value; }
}

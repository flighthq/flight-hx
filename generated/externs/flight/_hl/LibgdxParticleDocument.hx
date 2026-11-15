package flight._hl;

abstract LibgdxParticleDocument(hl.Bytes) {
	public var additive(get, set):Bool;

	inline function get_additive():Bool return this.getUI8(0) != 0;

	inline function set_additive(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var imageCount(get, set):Single;

	inline function get_imageCount():Single return this.getF32(368);

	inline function set_imageCount(value:Single):Single { this.setF32(368, value); return value; }
	public var maxParticleCount(get, set):Single;

	inline function get_maxParticleCount():Single return this.getF32(544);

	inline function set_maxParticleCount(value:Single):Single { this.setF32(544, value); return value; }
	public var minParticleCount(get, set):Single;

	inline function get_minParticleCount():Single return this.getF32(548);

	inline function set_minParticleCount(value:Single):Single { this.setF32(548, value); return value; }
	public var premultipliedAlpha(get, set):Bool;

	inline function get_premultipliedAlpha():Bool return this.getUI8(576) != 0;

	inline function set_premultipliedAlpha(value:Bool):Bool { this.setUI8(576, value ? 1 : 0); return value; }
}

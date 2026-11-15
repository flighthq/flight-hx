package flight._hl;

abstract ParticleObjectsUpdateOptions(hl.Bytes) {
	public var emitterX(get, set):Single;

	inline function get_emitterX():Single return this.getF32(0);

	inline function set_emitterX(value:Single):Single { this.setF32(0, value); return value; }
	public var emitterY(get, set):Single;

	inline function get_emitterY():Single return this.getF32(4);

	inline function set_emitterY(value:Single):Single { this.setF32(4, value); return value; }
}

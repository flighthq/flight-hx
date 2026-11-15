package flight._hl;

abstract ParticleEmitterState(hl.Bytes) {
	public var burstTimer(get, set):Single;

	inline function get_burstTimer():Single return this.getF32(0);

	inline function set_burstTimer(value:Single):Single { this.setF32(0, value); return value; }
	public var emitterAge(get, set):Single;

	inline function get_emitterAge():Single return this.getF32(56);

	inline function set_emitterAge(value:Single):Single { this.setF32(56, value); return value; }
	public var prevX(get, set):Single;

	inline function get_prevX():Single return this.getF32(88);

	inline function set_prevX(value:Single):Single { this.setF32(88, value); return value; }
	public var prevY(get, set):Single;

	inline function get_prevY():Single return this.getF32(92);

	inline function set_prevY(value:Single):Single { this.setF32(92, value); return value; }
	public var prevZ(get, set):Single;

	inline function get_prevZ():Single return this.getF32(96);

	inline function set_prevZ(value:Single):Single { this.setF32(96, value); return value; }
	public var spawnAccumulator(get, set):Single;

	inline function get_spawnAccumulator():Single return this.getF32(168);

	inline function set_spawnAccumulator(value:Single):Single { this.setF32(168, value); return value; }
}

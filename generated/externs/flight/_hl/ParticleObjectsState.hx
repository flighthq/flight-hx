package flight._hl;

abstract ParticleObjectsState(hl.Bytes) {
	public var burstTimer(get, set):Single;

	inline function get_burstTimer():Single return this.getF32(0);

	inline function set_burstTimer(value:Single):Single { this.setF32(0, value); return value; }
	public var emitterAge(get, set):Single;

	inline function get_emitterAge():Single return this.getF32(4);

	inline function set_emitterAge(value:Single):Single { this.setF32(4, value); return value; }
	public var prevX(get, set):Single;

	inline function get_prevX():Single return this.getF32(32);

	inline function set_prevX(value:Single):Single { this.setF32(32, value); return value; }
	public var prevY(get, set):Single;

	inline function get_prevY():Single return this.getF32(36);

	inline function set_prevY(value:Single):Single { this.setF32(36, value); return value; }
	public var spawnAccumulator(get, set):Single;

	inline function get_spawnAccumulator():Single return this.getF32(104);

	inline function set_spawnAccumulator(value:Single):Single { this.setF32(104, value); return value; }
}

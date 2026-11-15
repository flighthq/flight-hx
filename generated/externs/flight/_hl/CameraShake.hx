package flight._hl;

abstract CameraShake(hl.Bytes) {
	public var trauma(get, set):Single;

	inline function get_trauma():Single return this.getF32(16);

	inline function set_trauma(value:Single):Single { this.setF32(16, value); return value; }
	public var decay(get, set):Single;

	inline function get_decay():Single return this.getF32(20);

	inline function set_decay(value:Single):Single { this.setF32(20, value); return value; }
	public var frequency(get, set):Single;

	inline function get_frequency():Single return this.getF32(24);

	inline function set_frequency(value:Single):Single { this.setF32(24, value); return value; }
	public var translationAmplitude(get, set):Single;

	inline function get_translationAmplitude():Single return this.getF32(28);

	inline function set_translationAmplitude(value:Single):Single { this.setF32(28, value); return value; }
	public var rotationAmplitude(get, set):Single;

	inline function get_rotationAmplitude():Single return this.getF32(32);

	inline function set_rotationAmplitude(value:Single):Single { this.setF32(32, value); return value; }
	public var time(get, set):Single;

	inline function get_time():Single return this.getF32(36);

	inline function set_time(value:Single):Single { this.setF32(36, value); return value; }
}

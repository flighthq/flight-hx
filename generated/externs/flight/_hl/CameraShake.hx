package flight._hl;

abstract CameraShake(hl.Bytes) {
	public var trauma(get, set):Float;

	inline function get_trauma():Float return this.getF64(16);

	inline function set_trauma(value:Float):Float { this.setF64(16, value); return value; }
	public var decay(get, set):Float;

	inline function get_decay():Float return this.getF64(24);

	inline function set_decay(value:Float):Float { this.setF64(24, value); return value; }
	public var frequency(get, set):Float;

	inline function get_frequency():Float return this.getF64(32);

	inline function set_frequency(value:Float):Float { this.setF64(32, value); return value; }
	public var translationAmplitude(get, set):Float;

	inline function get_translationAmplitude():Float return this.getF64(40);

	inline function set_translationAmplitude(value:Float):Float { this.setF64(40, value); return value; }
	public var rotationAmplitude(get, set):Float;

	inline function get_rotationAmplitude():Float return this.getF64(48);

	inline function set_rotationAmplitude(value:Float):Float { this.setF64(48, value); return value; }
	public var time(get, set):Float;

	inline function get_time():Float return this.getF64(56);

	inline function set_time(value:Float):Float { this.setF64(56, value); return value; }
}

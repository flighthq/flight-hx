package flight._hl;

abstract FlyCameraController(hl.Bytes) {
	public var goalPitch(get, set):Float;

	inline function get_goalPitch():Float return this.getF64(16);

	inline function set_goalPitch(value:Float):Float { this.setF64(16, value); return value; }
	public var goalYaw(get, set):Float;

	inline function get_goalYaw():Float return this.getF64(24);

	inline function set_goalYaw(value:Float):Float { this.setF64(24, value); return value; }
	public var maxPitch(get, set):Float;

	inline function get_maxPitch():Float return this.getF64(32);

	inline function set_maxPitch(value:Float):Float { this.setF64(32, value); return value; }
	public var minPitch(get, set):Float;

	inline function get_minPitch():Float return this.getF64(40);

	inline function set_minPitch(value:Float):Float { this.setF64(40, value); return value; }
	public var pitch(get, set):Float;

	inline function get_pitch():Float return this.getF64(48);

	inline function set_pitch(value:Float):Float { this.setF64(48, value); return value; }
	public var smoothTime(get, set):Float;

	inline function get_smoothTime():Float return this.getF64(64);

	inline function set_smoothTime(value:Float):Float { this.setF64(64, value); return value; }
	public var yaw(get, set):Float;

	inline function get_yaw():Float return this.getF64(72);

	inline function set_yaw(value:Float):Float { this.setF64(72, value); return value; }
}

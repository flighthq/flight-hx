package flight._hl;

abstract FlyCameraController(hl.Bytes) {
	public var goalPitch(get, set):Single;

	inline function get_goalPitch():Single return this.getF32(16);

	inline function set_goalPitch(value:Single):Single { this.setF32(16, value); return value; }
	public var goalYaw(get, set):Single;

	inline function get_goalYaw():Single return this.getF32(20);

	inline function set_goalYaw(value:Single):Single { this.setF32(20, value); return value; }
	public var maxPitch(get, set):Single;

	inline function get_maxPitch():Single return this.getF32(24);

	inline function set_maxPitch(value:Single):Single { this.setF32(24, value); return value; }
	public var minPitch(get, set):Single;

	inline function get_minPitch():Single return this.getF32(28);

	inline function set_minPitch(value:Single):Single { this.setF32(28, value); return value; }
	public var pitch(get, set):Single;

	inline function get_pitch():Single return this.getF32(32);

	inline function set_pitch(value:Single):Single { this.setF32(32, value); return value; }
	public var smoothTime(get, set):Single;

	inline function get_smoothTime():Single return this.getF32(48);

	inline function set_smoothTime(value:Single):Single { this.setF32(48, value); return value; }
	public var yaw(get, set):Single;

	inline function get_yaw():Single return this.getF32(52);

	inline function set_yaw(value:Single):Single { this.setF32(52, value); return value; }
}

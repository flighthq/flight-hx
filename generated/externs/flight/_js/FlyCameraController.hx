package flight._js;

abstract FlyCameraController(Dynamic) {
	public var goalPitch(get, set):Float;
	inline function get_goalPitch():Float return untyped this.goalPitch;
	inline function set_goalPitch(value:Float):Float return untyped this.goalPitch = value;
	public var goalYaw(get, set):Float;
	inline function get_goalYaw():Float return untyped this.goalYaw;
	inline function set_goalYaw(value:Float):Float return untyped this.goalYaw = value;
	public var maxPitch(get, set):Float;
	inline function get_maxPitch():Float return untyped this.maxPitch;
	inline function set_maxPitch(value:Float):Float return untyped this.maxPitch = value;
	public var minPitch(get, set):Float;
	inline function get_minPitch():Float return untyped this.minPitch;
	inline function set_minPitch(value:Float):Float return untyped this.minPitch = value;
	public var pitch(get, set):Float;
	inline function get_pitch():Float return untyped this.pitch;
	inline function set_pitch(value:Float):Float return untyped this.pitch = value;
	public var smoothTime(get, set):Float;
	inline function get_smoothTime():Float return untyped this.smoothTime;
	inline function set_smoothTime(value:Float):Float return untyped this.smoothTime = value;
	public var yaw(get, set):Float;
	inline function get_yaw():Float return untyped this.yaw;
	inline function set_yaw(value:Float):Float return untyped this.yaw = value;
}

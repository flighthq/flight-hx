package flight._hl;

abstract AnimationTrack(hl.Bytes) {
	public var components(get, set):Int;

	inline function get_components():Int return this.getI32(56);

	inline function set_components(value:Int):Int { this.setI32(56, value); return value; }
	public var quaternion(get, set):Bool;

	inline function get_quaternion():Bool return this.getUI8(64) != 0;

	inline function set_quaternion(value:Bool):Bool { this.setUI8(64, value ? 1 : 0); return value; }
}

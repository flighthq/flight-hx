package flight._hl;

abstract AnimationPlayer(hl.Bytes) {
	public var loopEnabled(get, set):Bool;

	inline function get_loopEnabled():Bool return this.getUI8(8) != 0;

	inline function set_loopEnabled(value:Bool):Bool { this.setUI8(8, value ? 1 : 0); return value; }
	public var playing(get, set):Bool;

	inline function get_playing():Bool return this.getUI8(112) != 0;

	inline function set_playing(value:Bool):Bool { this.setUI8(112, value ? 1 : 0); return value; }
	public var repeatCount(get, set):Int;

	inline function get_repeatCount():Int return this.getI32(116);

	inline function set_repeatCount(value:Int):Int { this.setI32(116, value); return value; }
	public var speed(get, set):Single;

	inline function get_speed():Single return this.getF32(120);

	inline function set_speed(value:Single):Single { this.setF32(120, value); return value; }
	public var time(get, set):Single;

	inline function get_time():Single return this.getF32(124);

	inline function set_time(value:Single):Single { this.setF32(124, value); return value; }
}

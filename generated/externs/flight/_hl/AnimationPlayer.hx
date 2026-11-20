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
	public var speed(get, set):Float;

	inline function get_speed():Float return this.getF64(120);

	inline function set_speed(value:Float):Float { this.setF64(120, value); return value; }
	public var time(get, set):Float;

	inline function get_time():Float return this.getF64(128);

	inline function set_time(value:Float):Float { this.setF64(128, value); return value; }
}

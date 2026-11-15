package flight._hl;

abstract SpritesheetPlayer(hl.Bytes) {
	public var complete(get, set):Bool;

	inline function get_complete():Bool return this.getUI8(24) != 0;

	inline function set_complete(value:Bool):Bool { this.setUI8(24, value ? 1 : 0); return value; }
	public var elapsed(get, set):Float;

	inline function get_elapsed():Float return this.getF64(32);

	inline function set_elapsed(value:Float):Float { this.setF64(32, value); return value; }
	public var paused(get, set):Bool;

	inline function get_paused():Bool return this.getUI8(40) != 0;

	inline function set_paused(value:Bool):Bool { this.setUI8(40, value ? 1 : 0); return value; }
	public var speed(get, set):Float;

	inline function get_speed():Float return this.getF64(48);

	inline function set_speed(value:Float):Float { this.setF64(48, value); return value; }
	public var frameIndex(get, set):Float;

	inline function get_frameIndex():Float return this.getF64(56);

	inline function set_frameIndex(value:Float):Float { this.setF64(56, value); return value; }
}

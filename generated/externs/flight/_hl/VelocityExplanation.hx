package flight._hl;

abstract VelocityExplanation(hl.Bytes) {
	public var currentFrameId(get, set):Int;

	inline function get_currentFrameId():Int return this.getI32(0);

	inline function set_currentFrameId(value:Int):Int { this.setI32(0, value); return value; }
	public var explicit(get, set):Bool;

	inline function get_explicit():Bool return this.getUI8(4) != 0;

	inline function set_explicit(value:Bool):Bool { this.setUI8(4, value ? 1 : 0); return value; }
	public var lastFrameId(get, set):Int;

	inline function get_lastFrameId():Int return this.getI32(8);

	inline function set_lastFrameId(value:Int):Int { this.setI32(8, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(16);

	inline function set_x(value:Single):Single { this.setF32(16, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(20);

	inline function set_y(value:Single):Single { this.setF32(20, value); return value; }
}

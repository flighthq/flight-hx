package flight._hl;

abstract Physics2DWorld(hl.Bytes) {
	public var gravityX(get, set):Float;

	inline function get_gravityX():Float return this.getF64(280);

	inline function set_gravityX(value:Float):Float { this.setF64(280, value); return value; }
	public var gravityY(get, set):Float;

	inline function get_gravityY():Float return this.getF64(288);

	inline function set_gravityY(value:Float):Float { this.setF64(288, value); return value; }
	public var nextBodyIndex(get, set):Int;

	inline function get_nextBodyIndex():Int return this.getI32(696);

	inline function set_nextBodyIndex(value:Int):Int { this.setI32(696, value); return value; }
	public var previousTimestep(get, set):Float;

	inline function get_previousTimestep():Float return this.getF64(704);

	inline function set_previousTimestep(value:Float):Float { this.setF64(704, value); return value; }
	public var version(get, set):Int;

	inline function get_version():Int return this.getI32(1024);

	inline function set_version(value:Int):Int { this.setI32(1024, value); return value; }
}

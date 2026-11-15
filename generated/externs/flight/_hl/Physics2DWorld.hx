package flight._hl;

abstract Physics2DWorld(hl.Bytes) {
	public var gravityX(get, set):Single;

	inline function get_gravityX():Single return this.getF32(248);

	inline function set_gravityX(value:Single):Single { this.setF32(248, value); return value; }
	public var gravityY(get, set):Single;

	inline function get_gravityY():Single return this.getF32(252);

	inline function set_gravityY(value:Single):Single { this.setF32(252, value); return value; }
	public var nextBodyIndex(get, set):Int;

	inline function get_nextBodyIndex():Int return this.getI32(656);

	inline function set_nextBodyIndex(value:Int):Int { this.setI32(656, value); return value; }
	public var previousTimestep(get, set):Float;

	inline function get_previousTimestep():Float return this.getF64(664);

	inline function set_previousTimestep(value:Float):Float { this.setF64(664, value); return value; }
	public var version(get, set):Int;

	inline function get_version():Int return this.getI32(984);

	inline function set_version(value:Int):Int { this.setI32(984, value); return value; }
}

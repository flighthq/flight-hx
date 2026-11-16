package flight._hl;

abstract Physics3DWorld(hl.Bytes) {
	public var version(get, set):Int;

	inline function get_version():Int return this.getI32(1072);

	inline function set_version(value:Int):Int { this.setI32(1072, value); return value; }
	public var gravityX(get, set):Single;

	inline function get_gravityX():Single return this.getF32(1112);

	inline function set_gravityX(value:Single):Single { this.setF32(1112, value); return value; }
	public var gravityY(get, set):Single;

	inline function get_gravityY():Single return this.getF32(1116);

	inline function set_gravityY(value:Single):Single { this.setF32(1116, value); return value; }
	public var gravityZ(get, set):Single;

	inline function get_gravityZ():Single return this.getF32(1120);

	inline function set_gravityZ(value:Single):Single { this.setF32(1120, value); return value; }
	public var previousTimestep(get, set):Single;

	inline function get_previousTimestep():Single return this.getF32(1124);

	inline function set_previousTimestep(value:Single):Single { this.setF32(1124, value); return value; }
	public var nextBodyIndex(get, set):Int;

	inline function get_nextBodyIndex():Int return this.getI32(1128);

	inline function set_nextBodyIndex(value:Int):Int { this.setI32(1128, value); return value; }
}

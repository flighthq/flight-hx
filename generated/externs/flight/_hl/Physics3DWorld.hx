package flight._hl;

abstract Physics3DWorld(hl.Bytes) {
	public var version(get, set):Int;

	inline function get_version():Int return this.getI32(1104);

	inline function set_version(value:Int):Int { this.setI32(1104, value); return value; }
	public var gravityX(get, set):Float;

	inline function get_gravityX():Float return this.getF64(1144);

	inline function set_gravityX(value:Float):Float { this.setF64(1144, value); return value; }
	public var gravityY(get, set):Float;

	inline function get_gravityY():Float return this.getF64(1152);

	inline function set_gravityY(value:Float):Float { this.setF64(1152, value); return value; }
	public var gravityZ(get, set):Float;

	inline function get_gravityZ():Float return this.getF64(1160);

	inline function set_gravityZ(value:Float):Float { this.setF64(1160, value); return value; }
	public var previousTimestep(get, set):Float;

	inline function get_previousTimestep():Float return this.getF64(1168);

	inline function set_previousTimestep(value:Float):Float { this.setF64(1168, value); return value; }
	public var nextBodyIndex(get, set):Int;

	inline function get_nextBodyIndex():Int return this.getI32(1176);

	inline function set_nextBodyIndex(value:Int):Int { this.setI32(1176, value); return value; }
}

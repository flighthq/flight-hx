package flight._hl;

abstract SpritesheetAnimation(hl.Bytes) {
	public var frameDuration(get, set):Float;

	inline function get_frameDuration():Float return this.getF64(40);

	inline function set_frameDuration(value:Float):Float { this.setF64(40, value); return value; }
	public var repeatCount(get, set):Int;

	inline function get_repeatCount():Int return this.getI32(76);

	inline function set_repeatCount(value:Int):Int { this.setI32(76, value); return value; }
	public var originX(get, set):Single;

	inline function get_originX():Single return this.getF32(80);

	inline function set_originX(value:Single):Single { this.setF32(80, value); return value; }
	public var originY(get, set):Single;

	inline function get_originY():Single return this.getF32(84);

	inline function set_originY(value:Single):Single { this.setF32(84, value); return value; }
}

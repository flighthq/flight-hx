package flight._hl;

abstract SpritesheetAnimationData(hl.Bytes) {
	public var frameDuration(get, set):Float;

	inline function get_frameDuration():Float return this.getF64(24);

	inline function set_frameDuration(value:Float):Float { this.setF64(24, value); return value; }
	public var repeatCount(get, set):Int;

	inline function get_repeatCount():Int return this.getI32(80);

	inline function set_repeatCount(value:Int):Int { this.setI32(80, value); return value; }
	public var originX(get, set):Single;

	inline function get_originX():Single return this.getF32(112);

	inline function set_originX(value:Single):Single { this.setF32(112, value); return value; }
	public var originY(get, set):Single;

	inline function get_originY():Single return this.getF32(116);

	inline function set_originY(value:Single):Single { this.setF32(116, value); return value; }
}

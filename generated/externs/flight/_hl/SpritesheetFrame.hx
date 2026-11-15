package flight._hl;

abstract SpritesheetFrame(hl.Bytes) {
	public var id(get, set):Int;

	inline function get_id():Int return this.getI32(16);

	inline function set_id(value:Int):Int { this.setI32(16, value); return value; }
	public var offsetX(get, set):Single;

	inline function get_offsetX():Single return this.getF32(20);

	inline function set_offsetX(value:Single):Single { this.setF32(20, value); return value; }
	public var offsetY(get, set):Single;

	inline function get_offsetY():Single return this.getF32(24);

	inline function set_offsetY(value:Single):Single { this.setF32(24, value); return value; }
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return this.getUI8(44) != 0;

	inline function set_rotated(value:Bool):Bool { this.setUI8(44, value ? 1 : 0); return value; }
}

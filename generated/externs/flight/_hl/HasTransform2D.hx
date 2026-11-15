package flight._hl;

abstract HasTransform2D(hl.Bytes) {
	public var pivotX(get, set):Single;

	inline function get_pivotX():Single return this.getF32(0);

	inline function set_pivotX(value:Single):Single { this.setF32(0, value); return value; }
	public var pivotY(get, set):Single;

	inline function get_pivotY():Single return this.getF32(4);

	inline function set_pivotY(value:Single):Single { this.setF32(4, value); return value; }
	public var rotation(get, set):Single;

	inline function get_rotation():Single return this.getF32(8);

	inline function set_rotation(value:Single):Single { this.setF32(8, value); return value; }
	public var scaleX(get, set):Single;

	inline function get_scaleX():Single return this.getF32(12);

	inline function set_scaleX(value:Single):Single { this.setF32(12, value); return value; }
	public var scaleY(get, set):Single;

	inline function get_scaleY():Single return this.getF32(16);

	inline function set_scaleY(value:Single):Single { this.setF32(16, value); return value; }
	public var skewX(get, set):Single;

	inline function get_skewX():Single return this.getF32(20);

	inline function set_skewX(value:Single):Single { this.setF32(20, value); return value; }
	public var skewY(get, set):Single;

	inline function get_skewY():Single return this.getF32(24);

	inline function set_skewY(value:Single):Single { this.setF32(24, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(28);

	inline function set_x(value:Single):Single { this.setF32(28, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(32);

	inline function set_y(value:Single):Single { this.setF32(32, value); return value; }
}

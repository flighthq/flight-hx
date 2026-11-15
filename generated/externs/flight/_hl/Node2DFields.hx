package flight._hl;

abstract Node2DFields(hl.Bytes) {
	public var alpha(get, set):Single;

	inline function get_alpha():Single return this.getF32(736);

	inline function set_alpha(value:Single):Single { this.setF32(736, value); return value; }
	public var pivotX(get, set):Single;

	inline function get_pivotX():Single return this.getF32(808);

	inline function set_pivotX(value:Single):Single { this.setF32(808, value); return value; }
	public var pivotY(get, set):Single;

	inline function get_pivotY():Single return this.getF32(812);

	inline function set_pivotY(value:Single):Single { this.setF32(812, value); return value; }
	public var rotation(get, set):Single;

	inline function get_rotation():Single return this.getF32(816);

	inline function set_rotation(value:Single):Single { this.setF32(816, value); return value; }
	public var scaleX(get, set):Single;

	inline function get_scaleX():Single return this.getF32(820);

	inline function set_scaleX(value:Single):Single { this.setF32(820, value); return value; }
	public var scaleY(get, set):Single;

	inline function get_scaleY():Single return this.getF32(824);

	inline function set_scaleY(value:Single):Single { this.setF32(824, value); return value; }
	public var skewX(get, set):Single;

	inline function get_skewX():Single return this.getF32(828);

	inline function set_skewX(value:Single):Single { this.setF32(828, value); return value; }
	public var skewY(get, set):Single;

	inline function get_skewY():Single return this.getF32(832);

	inline function set_skewY(value:Single):Single { this.setF32(832, value); return value; }
	public var visible(get, set):Bool;

	inline function get_visible():Bool return this.getUI8(836) != 0;

	inline function set_visible(value:Bool):Bool { this.setUI8(836, value ? 1 : 0); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(840);

	inline function set_x(value:Single):Single { this.setF32(840, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(844);

	inline function set_y(value:Single):Single { this.setF32(844, value); return value; }
}

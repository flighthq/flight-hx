package flight._hl;

abstract SvgStyle(hl.Bytes) {
	public var fillOpacity(get, set):Single;

	inline function get_fillOpacity():Single return this.getF32(80);

	inline function set_fillOpacity(value:Single):Single { this.setF32(80, value); return value; }
	public var fontSize(get, set):Single;

	inline function get_fontSize():Single return this.getF32(136);

	inline function set_fontSize(value:Single):Single { this.setF32(136, value); return value; }
	public var opacity(get, set):Single;

	inline function get_opacity():Single return this.getF32(192);

	inline function set_opacity(value:Single):Single { this.setF32(192, value); return value; }
	public var strokeDashoffset(get, set):Single;

	inline function get_strokeDashoffset():Single return this.getF32(248);

	inline function set_strokeDashoffset(value:Single):Single { this.setF32(248, value); return value; }
	public var strokeMiterlimit(get, set):Single;

	inline function get_strokeMiterlimit():Single return this.getF32(304);

	inline function set_strokeMiterlimit(value:Single):Single { this.setF32(304, value); return value; }
	public var strokeOpacity(get, set):Single;

	inline function get_strokeOpacity():Single return this.getF32(308);

	inline function set_strokeOpacity(value:Single):Single { this.setF32(308, value); return value; }
	public var strokeWidth(get, set):Single;

	inline function get_strokeWidth():Single return this.getF32(312);

	inline function set_strokeWidth(value:Single):Single { this.setF32(312, value); return value; }
}

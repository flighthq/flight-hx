package flight._hl;

abstract LibgdxRangeValue(hl.Bytes) {
	public var lowMin(get, set):Single;

	inline function get_lowMin():Single return this.getF32(0);

	inline function set_lowMin(value:Single):Single { this.setF32(0, value); return value; }
	public var lowMax(get, set):Single;

	inline function get_lowMax():Single return this.getF32(4);

	inline function set_lowMax(value:Single):Single { this.setF32(4, value); return value; }
	public var highMin(get, set):Single;

	inline function get_highMin():Single return this.getF32(8);

	inline function set_highMin(value:Single):Single { this.setF32(8, value); return value; }
	public var highMax(get, set):Single;

	inline function get_highMax():Single return this.getF32(12);

	inline function set_highMax(value:Single):Single { this.setF32(12, value); return value; }
	public var relative(get, set):Bool;

	inline function get_relative():Bool return this.getUI8(16) != 0;

	inline function set_relative(value:Bool):Bool { this.setUI8(16, value ? 1 : 0); return value; }
}

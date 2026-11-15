package flight._hl;

abstract LibgdxActiveRangeValue(hl.Bytes) {
	public var active(get, set):Bool;

	inline function get_active():Bool return this.getUI8(0) != 0;

	inline function set_active(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var lowMin(get, set):Single;

	inline function get_lowMin():Single return this.getF32(4);

	inline function set_lowMin(value:Single):Single { this.setF32(4, value); return value; }
	public var lowMax(get, set):Single;

	inline function get_lowMax():Single return this.getF32(8);

	inline function set_lowMax(value:Single):Single { this.setF32(8, value); return value; }
	public var highMin(get, set):Single;

	inline function get_highMin():Single return this.getF32(12);

	inline function set_highMin(value:Single):Single { this.setF32(12, value); return value; }
	public var highMax(get, set):Single;

	inline function get_highMax():Single return this.getF32(16);

	inline function set_highMax(value:Single):Single { this.setF32(16, value); return value; }
	public var relative(get, set):Bool;

	inline function get_relative():Bool return this.getUI8(20) != 0;

	inline function set_relative(value:Bool):Bool { this.setUI8(20, value ? 1 : 0); return value; }
}

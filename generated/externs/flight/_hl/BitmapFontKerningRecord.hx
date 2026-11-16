package flight._hl;

abstract BitmapFontKerningRecord(hl.Bytes) {
	public var amount(get, set):Single;

	inline function get_amount():Single return this.getF32(0);

	inline function set_amount(value:Single):Single { this.setF32(0, value); return value; }
	public var first(get, set):Int;

	inline function get_first():Int return this.getI32(4);

	inline function set_first(value:Int):Int { this.setI32(4, value); return value; }
	public var second(get, set):Int;

	inline function get_second():Int return this.getI32(8);

	inline function set_second(value:Int):Int { this.setI32(8, value); return value; }
}

package flight._hl;

abstract GridSliceOptions(hl.Bytes) {
	public var columns(get, set):Int;

	inline function get_columns():Int return this.getI32(0);

	inline function set_columns(value:Int):Int { this.setI32(0, value); return value; }
	public var imageHeight(get, set):Single;

	inline function get_imageHeight():Single return this.getF32(48);

	inline function set_imageHeight(value:Single):Single { this.setF32(48, value); return value; }
	public var imageWidth(get, set):Single;

	inline function get_imageWidth():Single return this.getF32(52);

	inline function set_imageWidth(value:Single):Single { this.setF32(52, value); return value; }
	public var rows(get, set):Int;

	inline function get_rows():Int return this.getI32(96);

	inline function set_rows(value:Int):Int { this.setI32(96, value); return value; }
}

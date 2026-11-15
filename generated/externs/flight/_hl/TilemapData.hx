package flight._hl;

abstract TilemapData(hl.Bytes) {
	public var columns(get, set):Int;

	inline function get_columns():Int return this.getI32(24);

	inline function set_columns(value:Int):Int { this.setI32(24, value); return value; }
	public var rows(get, set):Int;

	inline function get_rows():Int return this.getI32(56);

	inline function set_rows(value:Int):Int { this.setI32(56, value); return value; }
	public var tileHeight(get, set):Single;

	inline function get_tileHeight():Single return this.getF32(60);

	inline function set_tileHeight(value:Single):Single { this.setF32(60, value); return value; }
	public var tileWidth(get, set):Single;

	inline function get_tileWidth():Single return this.getF32(64);

	inline function set_tileWidth(value:Single):Single { this.setF32(64, value); return value; }
}

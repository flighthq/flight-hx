package flight._hl;

abstract TilemapData(hl.Bytes) {
	public var columns(get, set):Int;

	inline function get_columns():Int return this.getI32(24);

	inline function set_columns(value:Int):Int { this.setI32(24, value); return value; }
	public var rows(get, set):Int;

	inline function get_rows():Int return this.getI32(56);

	inline function set_rows(value:Int):Int { this.setI32(56, value); return value; }
	public var tileHeight(get, set):Float;

	inline function get_tileHeight():Float return this.getF64(64);

	inline function set_tileHeight(value:Float):Float { this.setF64(64, value); return value; }
	public var tileWidth(get, set):Float;

	inline function get_tileWidth():Float return this.getF64(72);

	inline function set_tileWidth(value:Float):Float { this.setF64(72, value); return value; }
}

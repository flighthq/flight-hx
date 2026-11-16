package flight._js;

abstract TilemapData(Dynamic) {
	public var columns(get, set):Int;
	inline function get_columns():Int return untyped this.columns;
	inline function set_columns(value:Int):Int return untyped this.columns = value;
	public var rows(get, set):Int;
	inline function get_rows():Int return untyped this.rows;
	inline function set_rows(value:Int):Int return untyped this.rows = value;
	public var tileHeight(get, set):Float;
	inline function get_tileHeight():Float return untyped this.tileHeight;
	inline function set_tileHeight(value:Float):Float return untyped this.tileHeight = value;
	public var tileWidth(get, set):Float;
	inline function get_tileWidth():Float return untyped this.tileWidth;
	inline function set_tileWidth(value:Float):Float return untyped this.tileWidth = value;
}

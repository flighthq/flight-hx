package flight._js;

abstract GridSliceOptions(Dynamic) {
	public var columns(get, set):Int;
	inline function get_columns():Int return untyped this.columns;
	inline function set_columns(value:Int):Int return untyped this.columns = value;
	public var imageHeight(get, set):Float;
	inline function get_imageHeight():Float return untyped this.imageHeight;
	inline function set_imageHeight(value:Float):Float return untyped this.imageHeight = value;
	public var imageWidth(get, set):Float;
	inline function get_imageWidth():Float return untyped this.imageWidth;
	inline function set_imageWidth(value:Float):Float return untyped this.imageWidth = value;
	public var rows(get, set):Int;
	inline function get_rows():Int return untyped this.rows;
	inline function set_rows(value:Int):Int return untyped this.rows = value;
}

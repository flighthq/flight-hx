package flight._js;

abstract TiledTileset(Dynamic) {
	public var columns(get, set):Int;
	inline function get_columns():Int return untyped this.columns;
	inline function set_columns(value:Int):Int return untyped this.columns = value;
	public var imageHeight(get, set):Int;
	inline function get_imageHeight():Int return untyped this.imageHeight;
	inline function set_imageHeight(value:Int):Int return untyped this.imageHeight = value;
	public var imageWidth(get, set):Int;
	inline function get_imageWidth():Int return untyped this.imageWidth;
	inline function set_imageWidth(value:Int):Int return untyped this.imageWidth = value;
	public var margin(get, set):Int;
	inline function get_margin():Int return untyped this.margin;
	inline function set_margin(value:Int):Int return untyped this.margin = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
	public var spacing(get, set):Int;
	inline function get_spacing():Int return untyped this.spacing;
	inline function set_spacing(value:Int):Int return untyped this.spacing = value;
	public var tileOffsetX(get, set):Int;
	inline function get_tileOffsetX():Int return untyped this.tileOffsetX;
	inline function set_tileOffsetX(value:Int):Int return untyped this.tileOffsetX = value;
	public var tileOffsetY(get, set):Int;
	inline function get_tileOffsetY():Int return untyped this.tileOffsetY;
	inline function set_tileOffsetY(value:Int):Int return untyped this.tileOffsetY = value;
	public var tileCount(get, set):Int;
	inline function get_tileCount():Int return untyped this.tileCount;
	inline function set_tileCount(value:Int):Int return untyped this.tileCount = value;
	public var tileHeight(get, set):Int;
	inline function get_tileHeight():Int return untyped this.tileHeight;
	inline function set_tileHeight(value:Int):Int return untyped this.tileHeight = value;
	public var tileWidth(get, set):Int;
	inline function get_tileWidth():Int return untyped this.tileWidth;
	inline function set_tileWidth(value:Int):Int return untyped this.tileWidth = value;
}

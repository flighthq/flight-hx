package flight._js;

abstract TiledTilesetLayout(Dynamic) {
	public var tileHeight(get, set):Float;
	inline function get_tileHeight():Float return untyped this.tileHeight;
	inline function set_tileHeight(value:Float):Float return untyped this.tileHeight = value;
	public var tileWidth(get, set):Float;
	inline function get_tileWidth():Float return untyped this.tileWidth;
	inline function set_tileWidth(value:Float):Float return untyped this.tileWidth = value;
}

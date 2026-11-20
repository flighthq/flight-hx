package flight._js;

abstract TiledTilesetTileFrame(Dynamic) {
	public var duration(get, set):Int;
	inline function get_duration():Int return untyped this.duration;
	inline function set_duration(value:Int):Int return untyped this.duration = value;
	public var tileId(get, set):Int;
	inline function get_tileId():Int return untyped this.tileId;
	inline function set_tileId(value:Int):Int return untyped this.tileId = value;
}

package flight._js;

abstract TiledTilesetRef(Dynamic) {
	public var firstGid(get, set):Int;
	inline function get_firstGid():Int return untyped this.firstGid;
	inline function set_firstGid(value:Int):Int return untyped this.firstGid = value;
}

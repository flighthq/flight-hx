package flight._js;

abstract TiledTilesetTile(Dynamic) {
	public var id(get, set):Int;
	inline function get_id():Int return untyped this.id;
	inline function set_id(value:Int):Int return untyped this.id = value;
	public var tileType(get, set):String;
	inline function get_tileType():String return untyped this.tileType;
	inline function set_tileType(value:String):String return untyped this.tileType = value;
}

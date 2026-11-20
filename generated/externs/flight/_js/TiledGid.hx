package flight._js;

abstract TiledGid(Dynamic) {
	public var flipDiagonal(get, set):Bool;
	inline function get_flipDiagonal():Bool return untyped this.flipDiagonal;
	inline function set_flipDiagonal(value:Bool):Bool return untyped this.flipDiagonal = value;
	public var flipHorizontal(get, set):Bool;
	inline function get_flipHorizontal():Bool return untyped this.flipHorizontal;
	inline function set_flipHorizontal(value:Bool):Bool return untyped this.flipHorizontal = value;
	public var flipVertical(get, set):Bool;
	inline function get_flipVertical():Bool return untyped this.flipVertical;
	inline function set_flipVertical(value:Bool):Bool return untyped this.flipVertical = value;
	public var tileId(get, set):Int;
	inline function get_tileId():Int return untyped this.tileId;
	inline function set_tileId(value:Int):Int return untyped this.tileId = value;
}

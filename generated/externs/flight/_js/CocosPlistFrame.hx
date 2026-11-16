package flight._js;

abstract CocosPlistFrame(Dynamic) {
	public var spriteTrimmed(get, set):Bool;
	inline function get_spriteTrimmed():Bool return untyped this.spriteTrimmed;
	inline function set_spriteTrimmed(value:Bool):Bool return untyped this.spriteTrimmed = value;
	public var textureRotated(get, set):Bool;
	inline function get_textureRotated():Bool return untyped this.textureRotated;
	inline function set_textureRotated(value:Bool):Bool return untyped this.textureRotated = value;
}

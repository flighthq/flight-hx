package flight._js;

abstract CocosPlistFrame(Dynamic) {
	public var frame(get, set):String;
	inline function get_frame():String return untyped this["frame"];
	inline function set_frame(value:String):String return untyped this["frame"] = value;
	public var spriteOffset(get, set):String;
	inline function get_spriteOffset():String return untyped this["spriteOffset"];
	inline function set_spriteOffset(value:String):String return untyped this["spriteOffset"] = value;
	public var spriteSize(get, set):String;
	inline function get_spriteSize():String return untyped this["spriteSize"];
	inline function set_spriteSize(value:String):String return untyped this["spriteSize"] = value;
	public var spriteSourceSize(get, set):String;
	inline function get_spriteSourceSize():String return untyped this["spriteSourceSize"];
	inline function set_spriteSourceSize(value:String):String return untyped this["spriteSourceSize"] = value;
	public var spriteTrimmed(get, set):Bool;
	inline function get_spriteTrimmed():Bool return untyped this["spriteTrimmed"];
	inline function set_spriteTrimmed(value:Bool):Bool return untyped this["spriteTrimmed"] = value;
	public var textureRotated(get, set):Bool;
	inline function get_textureRotated():Bool return untyped this["textureRotated"];
	inline function set_textureRotated(value:Bool):Bool return untyped this["textureRotated"] = value;
}

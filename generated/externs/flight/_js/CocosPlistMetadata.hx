package flight._js;

abstract CocosPlistMetadata(Dynamic) {
	public var format(get, set):Int;
	inline function get_format():Int return untyped this.format;
	inline function set_format(value:Int):Int return untyped this.format = value;
	public var size(get, set):String;
	inline function get_size():String return untyped this.size;
	inline function set_size(value:String):String return untyped this.size = value;
	public var textureFileName(get, set):String;
	inline function get_textureFileName():String return untyped this.textureFileName;
	inline function set_textureFileName(value:String):String return untyped this.textureFileName = value;
}

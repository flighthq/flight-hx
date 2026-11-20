package flight._js;

abstract Blob(Dynamic) {
	public var mimeType(get, set):String;
	inline function get_mimeType():String return untyped this.mimeType;
	inline function set_mimeType(value:String):String return untyped this.mimeType = value;
	public var size(get, set):Int;
	inline function get_size():Int return untyped this.size;
	inline function set_size(value:Int):Int return untyped this.size = value;
}

package flight._js;

abstract StarlingDocument(Dynamic) {
	public var imagePath(get, set):String;
	inline function get_imagePath():String return untyped this.imagePath;
	inline function set_imagePath(value:String):String return untyped this.imagePath = value;
}

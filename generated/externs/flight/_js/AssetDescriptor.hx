package flight._js;

abstract AssetDescriptor(Dynamic) {
	public var id(get, set):String;
	inline function get_id():String return untyped this.id;
	inline function set_id(value:String):String return untyped this.id = value;
	public var url(get, set):String;
	inline function get_url():String return untyped this.url;
	inline function set_url(value:String):String return untyped this.url = value;
}

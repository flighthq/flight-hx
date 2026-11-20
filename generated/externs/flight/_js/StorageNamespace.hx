package flight._js;

abstract StorageNamespace(Dynamic) {
	public var prefix(get, set):String;
	inline function get_prefix():String return untyped this.prefix;
	inline function set_prefix(value:String):String return untyped this.prefix = value;
}

package flight._js;

abstract ExternalImageResourceReference(Dynamic) {
	public var uri(get, set):String;
	inline function get_uri():String return untyped this["uri"];
	inline function set_uri(value:String):String return untyped this["uri"] = value;
}

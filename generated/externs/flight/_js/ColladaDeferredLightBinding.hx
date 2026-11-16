package flight._js;

abstract ColladaDeferredLightBinding(Dynamic) {
	public var nodeIndex(get, set):Int;
	inline function get_nodeIndex():Int return untyped this["nodeIndex"];
	inline function set_nodeIndex(value:Int):Int return untyped this["nodeIndex"] = value;
	public var url(get, set):String;
	inline function get_url():String return untyped this["url"];
	inline function set_url(value:String):String return untyped this["url"] = value;
}

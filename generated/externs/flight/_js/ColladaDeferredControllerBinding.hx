package flight._js;

abstract ColladaDeferredControllerBinding(Dynamic) {
	public var controllerId(get, set):String;
	inline function get_controllerId():String return untyped this["controllerId"];
	inline function set_controllerId(value:String):String return untyped this["controllerId"] = value;
	public var nodeIndex(get, set):Int;
	inline function get_nodeIndex():Int return untyped this["nodeIndex"];
	inline function set_nodeIndex(value:Int):Int return untyped this["nodeIndex"] = value;
}

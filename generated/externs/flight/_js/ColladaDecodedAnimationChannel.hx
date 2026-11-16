package flight._js;

abstract ColladaDecodedAnimationChannel(Dynamic) {
	public var target(get, set):String;
	inline function get_target():String return untyped this["target"];
	inline function set_target(value:String):String return untyped this["target"] = value;
}

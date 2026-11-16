package flight._js;

abstract ThreeDsCamera(Dynamic) {
	public var focalLength(get, set):Float;
	inline function get_focalLength():Float return untyped this["focalLength"];
	inline function set_focalLength(value:Float):Float return untyped this["focalLength"] = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this["name"];
	inline function set_name(value:String):String return untyped this["name"] = value;
	public var roll(get, set):Float;
	inline function get_roll():Float return untyped this["roll"];
	inline function set_roll(value:Float):Float return untyped this["roll"] = value;
}

package flight._js;

abstract Scene3DDocumentAnimation(Dynamic) {
	public var duration(get, set):Float;
	inline function get_duration():Float return untyped this["duration"];
	inline function set_duration(value:Float):Float return untyped this["duration"] = value;
}

package flight._js;

abstract Scene3DLightBlock(Dynamic) {
	public var ambientCount(get, set):Int;
	inline function get_ambientCount():Int return untyped this["ambientCount"];
	inline function set_ambientCount(value:Int):Int return untyped this["ambientCount"] = value;
	public var directionalCount(get, set):Int;
	inline function get_directionalCount():Int return untyped this["directionalCount"];
	inline function set_directionalCount(value:Int):Int return untyped this["directionalCount"] = value;
	public var hemisphereCount(get, set):Int;
	inline function get_hemisphereCount():Int return untyped this["hemisphereCount"];
	inline function set_hemisphereCount(value:Int):Int return untyped this["hemisphereCount"] = value;
	public var pointCount(get, set):Int;
	inline function get_pointCount():Int return untyped this["pointCount"];
	inline function set_pointCount(value:Int):Int return untyped this["pointCount"] = value;
	public var spotCount(get, set):Int;
	inline function get_spotCount():Int return untyped this["spotCount"];
	inline function set_spotCount(value:Int):Int return untyped this["spotCount"] = value;
	public var version(get, set):Int;
	inline function get_version():Int return untyped this["version"];
	inline function set_version(value:Int):Int return untyped this["version"] = value;
}

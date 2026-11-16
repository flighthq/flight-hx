package flight._js;

abstract HasTransform3DRuntime(Dynamic) {
	public var localMatrix4Detached(get, set):Bool;
	inline function get_localMatrix4Detached():Bool return untyped this["localMatrix4Detached"];
	inline function set_localMatrix4Detached(value:Bool):Bool return untyped this["localMatrix4Detached"] = value;
}

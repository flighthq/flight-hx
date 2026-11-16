package flight._js;

abstract Physics3DQueryHit(Dynamic) {
	public var colliderIndex(get, set):Int;
	inline function get_colliderIndex():Int return untyped this["colliderIndex"];
	inline function set_colliderIndex(value:Int):Int return untyped this["colliderIndex"] = value;
}

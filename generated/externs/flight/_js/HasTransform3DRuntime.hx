package flight._js;

@:jsRequire("flight")
private extern class HasTransform3DRuntime_Ffi {
	@:native("flight_get_has_transform3_druntime_local_matrix4_detached") static function get_localMatrix4Detached(ptr:Dynamic):Bool;
	@:native("flight_set_has_transform3_druntime_local_matrix4_detached") static function set_localMatrix4Detached(ptr:Dynamic, value:Bool):Bool;
}

abstract HasTransform3DRuntime(Dynamic) {
	public var localMatrix4Detached(get, set):Bool;

	inline function get_localMatrix4Detached():Bool return HasTransform3DRuntime_Ffi.get_localMatrix4Detached(this);

	inline function set_localMatrix4Detached(value:Bool):Bool return HasTransform3DRuntime_Ffi.set_localMatrix4Detached(this, value);
}

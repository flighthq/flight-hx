package flight._js;

@:jsRequire("flight")
private extern class RivePathRecord_Ffi {
	@:native("flight_get_rive_path_record_path_index") static function get_pathIndex(ptr:Dynamic):Int;
	@:native("flight_set_rive_path_record_path_index") static function set_pathIndex(ptr:Dynamic, value:Int):Int;
}

abstract RivePathRecord(Dynamic) {
	public var pathIndex(get, set):Int;

	inline function get_pathIndex():Int return RivePathRecord_Ffi.get_pathIndex(this);

	inline function set_pathIndex(value:Int):Int return RivePathRecord_Ffi.set_pathIndex(this, value);
}

package flight._js;

@:jsRequire("flight")
private extern class RiveCoreObjectHandlerEntry_Ffi {
	@:native("flight_get_rive_core_object_handler_entry_type_key") static function get_typeKey(ptr:Dynamic):Int;
	@:native("flight_set_rive_core_object_handler_entry_type_key") static function set_typeKey(ptr:Dynamic, value:Int):Int;
}

abstract RiveCoreObjectHandlerEntry(Dynamic) {
	public var typeKey(get, set):Int;

	inline function get_typeKey():Int return RiveCoreObjectHandlerEntry_Ffi.get_typeKey(this);

	inline function set_typeKey(value:Int):Int return RiveCoreObjectHandlerEntry_Ffi.set_typeKey(this, value);
}

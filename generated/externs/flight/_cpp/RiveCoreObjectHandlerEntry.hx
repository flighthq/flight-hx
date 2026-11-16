package flight._cpp;

private extern class RiveCoreObjectHandlerEntry_Ffi {
	@:native("flight_get_rive_core_object_handler_entry_type_key") static function get_typeKey(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_rive_core_object_handler_entry_type_key") static function set_typeKey(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract RiveCoreObjectHandlerEntry(cpp.Star<cpp.Void>) {
	public var typeKey(get, set):Int;

	inline function get_typeKey():Int return RiveCoreObjectHandlerEntry_Ffi.get_typeKey(this);

	inline function set_typeKey(value:Int):Int { RiveCoreObjectHandlerEntry_Ffi.set_typeKey(this, value); return value; }
}

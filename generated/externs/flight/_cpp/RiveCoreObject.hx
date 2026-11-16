package flight._cpp;

private extern class RiveCoreObject_Ffi {
	@:native("flight_get_rive_core_object_type_key") static function get_typeKey(ptr:cpp.Star<cpp.Void>):haxe.Int64;
	@:native("flight_set_rive_core_object_type_key") static function set_typeKey(ptr:cpp.Star<cpp.Void>, value:haxe.Int64):haxe.Int64;
}

abstract RiveCoreObject(cpp.Star<cpp.Void>) {
	public var typeKey(get, set):haxe.Int64;

	inline function get_typeKey():haxe.Int64 return RiveCoreObject_Ffi.get_typeKey(this);

	inline function set_typeKey(value:haxe.Int64):haxe.Int64 { RiveCoreObject_Ffi.set_typeKey(this, value); return value; }
}

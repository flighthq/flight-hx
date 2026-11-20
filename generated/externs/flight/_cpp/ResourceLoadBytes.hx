package flight._cpp;

private extern class ResourceLoadBytes_Ffi {
	@:native("flight_get_resource_load_bytes_bytes_loaded") static function get_bytesLoaded(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_resource_load_bytes_bytes_loaded") static function set_bytesLoaded(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_resource_load_bytes_bytes_total_known") static function get_bytesTotalKnown(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_resource_load_bytes_bytes_total_known") static function set_bytesTotalKnown(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_resource_load_bytes_items_with_known_bytes") static function get_itemsWithKnownBytes(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_resource_load_bytes_items_with_known_bytes") static function set_itemsWithKnownBytes(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ResourceLoadBytes(cpp.Star<cpp.Void>) {
	public var bytesLoaded(get, set):Single;

	inline function get_bytesLoaded():Single return ResourceLoadBytes_Ffi.get_bytesLoaded(this);

	inline function set_bytesLoaded(value:Single):Single { ResourceLoadBytes_Ffi.set_bytesLoaded(this, value); return value; }
	public var bytesTotalKnown(get, set):Single;

	inline function get_bytesTotalKnown():Single return ResourceLoadBytes_Ffi.get_bytesTotalKnown(this);

	inline function set_bytesTotalKnown(value:Single):Single { ResourceLoadBytes_Ffi.set_bytesTotalKnown(this, value); return value; }
	public var itemsWithKnownBytes(get, set):Int;

	inline function get_itemsWithKnownBytes():Int return ResourceLoadBytes_Ffi.get_itemsWithKnownBytes(this);

	inline function set_itemsWithKnownBytes(value:Int):Int { ResourceLoadBytes_Ffi.set_itemsWithKnownBytes(this, value); return value; }
}

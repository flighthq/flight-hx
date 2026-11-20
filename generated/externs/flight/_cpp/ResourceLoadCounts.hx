package flight._cpp;

private extern class ResourceLoadCounts_Ffi {
	@:native("flight_get_resource_load_counts_settled_items") static function get_settledItems(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_resource_load_counts_settled_items") static function set_settledItems(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_resource_load_counts_in_flight_items") static function get_inFlightItems(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_resource_load_counts_in_flight_items") static function set_inFlightItems(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_resource_load_counts_queued_items") static function get_queuedItems(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_resource_load_counts_queued_items") static function set_queuedItems(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_resource_load_counts_total_items") static function get_totalItems(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_resource_load_counts_total_items") static function set_totalItems(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ResourceLoadCounts(cpp.Star<cpp.Void>) {
	public var settledItems(get, set):Int;

	inline function get_settledItems():Int return ResourceLoadCounts_Ffi.get_settledItems(this);

	inline function set_settledItems(value:Int):Int { ResourceLoadCounts_Ffi.set_settledItems(this, value); return value; }
	public var inFlightItems(get, set):Int;

	inline function get_inFlightItems():Int return ResourceLoadCounts_Ffi.get_inFlightItems(this);

	inline function set_inFlightItems(value:Int):Int { ResourceLoadCounts_Ffi.set_inFlightItems(this, value); return value; }
	public var queuedItems(get, set):Int;

	inline function get_queuedItems():Int return ResourceLoadCounts_Ffi.get_queuedItems(this);

	inline function set_queuedItems(value:Int):Int { ResourceLoadCounts_Ffi.set_queuedItems(this, value); return value; }
	public var totalItems(get, set):Int;

	inline function get_totalItems():Int return ResourceLoadCounts_Ffi.get_totalItems(this);

	inline function set_totalItems(value:Int):Int { ResourceLoadCounts_Ffi.set_totalItems(this, value); return value; }
}

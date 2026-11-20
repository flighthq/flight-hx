package flight._cpp;

private extern class AssetEntry_Ffi {
	@:native("flight_get_asset_entry_refcount") static function get_refcount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_asset_entry_refcount") static function set_refcount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_asset_entry_resident") static function get_resident(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_asset_entry_resident") static function set_resident(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract AssetEntry(cpp.Star<cpp.Void>) {
	public var refcount(get, set):Int;

	inline function get_refcount():Int return AssetEntry_Ffi.get_refcount(this);

	inline function set_refcount(value:Int):Int { AssetEntry_Ffi.set_refcount(this, value); return value; }
	public var resident(get, set):Bool;

	inline function get_resident():Bool return AssetEntry_Ffi.get_resident(this);

	inline function set_resident(value:Bool):Bool { AssetEntry_Ffi.set_resident(this, value); return value; }
}

package flight._cpp;

private extern class Awd2NodeIndexEntry_Ffi {
	@:native("flight_get_awd2_node_index_entry_key") static function get_key(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_node_index_entry_key") static function set_key(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_node_index_entry_value") static function get_value(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_node_index_entry_value") static function set_value(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Awd2NodeIndexEntry(cpp.Star<cpp.Void>) {
	public var key(get, set):Int;

	inline function get_key():Int return Awd2NodeIndexEntry_Ffi.get_key(this);

	inline function set_key(value:Int):Int { Awd2NodeIndexEntry_Ffi.set_key(this, value); return value; }
	public var value(get, set):Int;

	inline function get_value():Int return Awd2NodeIndexEntry_Ffi.get_value(this);

	inline function set_value(value:Int):Int { Awd2NodeIndexEntry_Ffi.set_value(this, value); return value; }
}

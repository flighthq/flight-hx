package flight._cpp;

private extern class SlotId_Ffi {
	@:native("flight_get_slot_id_value") static function get_value(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_slot_id_value") static function set_value(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract SlotId(cpp.Star<cpp.Void>) {
	public var value(get, set):Int;

	inline function get_value():Int return SlotId_Ffi.get_value(this);

	inline function set_value(value:Int):Int { SlotId_Ffi.set_value(this, value); return value; }
}

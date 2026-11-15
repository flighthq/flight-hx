package flight._js;

@:jsRequire("flight")
private extern class SlotId_Ffi {
	@:native("flight_get_slot_id_value") static function get_value(ptr:Dynamic):Int;
	@:native("flight_set_slot_id_value") static function set_value(ptr:Dynamic, value:Int):Int;
}

abstract SlotId(Dynamic) {
	public var value(get, set):Int;

	inline function get_value():Int return SlotId_Ffi.get_value(this);

	inline function set_value(value:Int):Int return SlotId_Ffi.set_value(this, value);
}

package flight._cpp;

private extern class PointerEventData_Ffi {
	@:native("flight_get_pointer_event_data_alt_key") static function get_altKey(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_pointer_event_data_alt_key") static function set_altKey(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_pointer_event_data_button") static function get_button(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_pointer_event_data_button") static function set_button(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_pointer_event_data_buttons") static function get_buttons(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_pointer_event_data_buttons") static function set_buttons(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_pointer_event_data_ctrl_key") static function get_ctrlKey(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_pointer_event_data_ctrl_key") static function set_ctrlKey(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_pointer_event_data_delta_x") static function get_deltaX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_pointer_event_data_delta_x") static function set_deltaX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_pointer_event_data_delta_y") static function get_deltaY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_pointer_event_data_delta_y") static function set_deltaY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_pointer_event_data_local_x") static function get_localX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_pointer_event_data_local_x") static function set_localX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_pointer_event_data_local_y") static function get_localY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_pointer_event_data_local_y") static function set_localY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_pointer_event_data_meta_key") static function get_metaKey(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_pointer_event_data_meta_key") static function set_metaKey(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_pointer_event_data_pointer_id") static function get_pointerId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_pointer_event_data_pointer_id") static function set_pointerId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_pointer_event_data_shift_key") static function get_shiftKey(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_pointer_event_data_shift_key") static function set_shiftKey(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_pointer_event_data_world_x") static function get_worldX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_pointer_event_data_world_x") static function set_worldX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_pointer_event_data_world_y") static function get_worldY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_pointer_event_data_world_y") static function set_worldY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_pointer_event_data_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_pointer_event_data_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_pointer_event_data_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_pointer_event_data_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract PointerEventData(cpp.Star<cpp.Void>) {
	public var altKey(get, set):Bool;

	inline function get_altKey():Bool return PointerEventData_Ffi.get_altKey(this);

	inline function set_altKey(value:Bool):Bool { PointerEventData_Ffi.set_altKey(this, value); return value; }
	public var button(get, set):Int;

	inline function get_button():Int return PointerEventData_Ffi.get_button(this);

	inline function set_button(value:Int):Int { PointerEventData_Ffi.set_button(this, value); return value; }
	public var buttons(get, set):Int;

	inline function get_buttons():Int return PointerEventData_Ffi.get_buttons(this);

	inline function set_buttons(value:Int):Int { PointerEventData_Ffi.set_buttons(this, value); return value; }
	public var ctrlKey(get, set):Bool;

	inline function get_ctrlKey():Bool return PointerEventData_Ffi.get_ctrlKey(this);

	inline function set_ctrlKey(value:Bool):Bool { PointerEventData_Ffi.set_ctrlKey(this, value); return value; }
	public var deltaX(get, set):Float;

	inline function get_deltaX():Float return PointerEventData_Ffi.get_deltaX(this);

	inline function set_deltaX(value:Float):Float { PointerEventData_Ffi.set_deltaX(this, value); return value; }
	public var deltaY(get, set):Float;

	inline function get_deltaY():Float return PointerEventData_Ffi.get_deltaY(this);

	inline function set_deltaY(value:Float):Float { PointerEventData_Ffi.set_deltaY(this, value); return value; }
	public var localX(get, set):Float;

	inline function get_localX():Float return PointerEventData_Ffi.get_localX(this);

	inline function set_localX(value:Float):Float { PointerEventData_Ffi.set_localX(this, value); return value; }
	public var localY(get, set):Float;

	inline function get_localY():Float return PointerEventData_Ffi.get_localY(this);

	inline function set_localY(value:Float):Float { PointerEventData_Ffi.set_localY(this, value); return value; }
	public var metaKey(get, set):Bool;

	inline function get_metaKey():Bool return PointerEventData_Ffi.get_metaKey(this);

	inline function set_metaKey(value:Bool):Bool { PointerEventData_Ffi.set_metaKey(this, value); return value; }
	public var pointerId(get, set):Int;

	inline function get_pointerId():Int return PointerEventData_Ffi.get_pointerId(this);

	inline function set_pointerId(value:Int):Int { PointerEventData_Ffi.set_pointerId(this, value); return value; }
	public var shiftKey(get, set):Bool;

	inline function get_shiftKey():Bool return PointerEventData_Ffi.get_shiftKey(this);

	inline function set_shiftKey(value:Bool):Bool { PointerEventData_Ffi.set_shiftKey(this, value); return value; }
	public var worldX(get, set):Float;

	inline function get_worldX():Float return PointerEventData_Ffi.get_worldX(this);

	inline function set_worldX(value:Float):Float { PointerEventData_Ffi.set_worldX(this, value); return value; }
	public var worldY(get, set):Float;

	inline function get_worldY():Float return PointerEventData_Ffi.get_worldY(this);

	inline function set_worldY(value:Float):Float { PointerEventData_Ffi.set_worldY(this, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return PointerEventData_Ffi.get_x(this);

	inline function set_x(value:Float):Float { PointerEventData_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return PointerEventData_Ffi.get_y(this);

	inline function set_y(value:Float):Float { PointerEventData_Ffi.set_y(this, value); return value; }
}

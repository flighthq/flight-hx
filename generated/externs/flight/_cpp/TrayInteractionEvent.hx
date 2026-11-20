package flight._cpp;

private extern class TrayInteractionEvent_Ffi {
	@:native("flight_get_tray_interaction_event_alt_key") static function get_altKey(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_tray_interaction_event_alt_key") static function set_altKey(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_tray_interaction_event_ctrl_key") static function get_ctrlKey(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_tray_interaction_event_ctrl_key") static function set_ctrlKey(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_tray_interaction_event_meta_key") static function get_metaKey(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_tray_interaction_event_meta_key") static function set_metaKey(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_tray_interaction_event_shift_key") static function get_shiftKey(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_tray_interaction_event_shift_key") static function set_shiftKey(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract TrayInteractionEvent(cpp.Star<cpp.Void>) {
	public var altKey(get, set):Bool;

	inline function get_altKey():Bool return TrayInteractionEvent_Ffi.get_altKey(this);

	inline function set_altKey(value:Bool):Bool { TrayInteractionEvent_Ffi.set_altKey(this, value); return value; }
	public var ctrlKey(get, set):Bool;

	inline function get_ctrlKey():Bool return TrayInteractionEvent_Ffi.get_ctrlKey(this);

	inline function set_ctrlKey(value:Bool):Bool { TrayInteractionEvent_Ffi.set_ctrlKey(this, value); return value; }
	public var metaKey(get, set):Bool;

	inline function get_metaKey():Bool return TrayInteractionEvent_Ffi.get_metaKey(this);

	inline function set_metaKey(value:Bool):Bool { TrayInteractionEvent_Ffi.set_metaKey(this, value); return value; }
	public var shiftKey(get, set):Bool;

	inline function get_shiftKey():Bool return TrayInteractionEvent_Ffi.get_shiftKey(this);

	inline function set_shiftKey(value:Bool):Bool { TrayInteractionEvent_Ffi.set_shiftKey(this, value); return value; }
}

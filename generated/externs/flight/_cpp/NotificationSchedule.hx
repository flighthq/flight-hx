package flight._cpp;

private extern class NotificationSchedule_Ffi {
	@:native("flight_get_notification_schedule_at") static function get_at(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_notification_schedule_at") static function set_at(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract NotificationSchedule(cpp.Star<cpp.Void>) {
	public var at(get, set):Single;

	inline function get_at():Single return NotificationSchedule_Ffi.get_at(this);

	inline function set_at(value:Single):Single { NotificationSchedule_Ffi.set_at(this, value); return value; }
}

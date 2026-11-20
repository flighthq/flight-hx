package flight._cpp._fn;

extern class Log {
	@:native("flight_free_log_timer")
	public static function freeLogTimer(ptr:flight._cpp.LogTimer):Void;
}

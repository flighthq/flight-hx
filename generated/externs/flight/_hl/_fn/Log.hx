package flight._hl._fn;

extern class Log {
	@:hlNative("flight", "flight_free_log_timer")
	public static function freeLogTimer(ptr:flight._hl.LogTimer):Void;
}

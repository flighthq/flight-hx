package flight._js._fn;

@:jsRequire("@flighthq/log")
extern class Log {
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeLogTimer(ptr:flight._js.LogTimer):Void {}
}

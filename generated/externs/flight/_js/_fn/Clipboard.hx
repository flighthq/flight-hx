package flight._js._fn;

@:jsRequire("@flighthq/clipboard")
extern class Clipboard {
	@:native("createClipboardWatch")
	public static function createClipboardWatch():flight._js.ClipboardWatch;
	@:native("attachClipboardWatch")
	public static function attachClipboardWatch(hostClipboardChange:flight._js.HostClipboardChangeSubscriber, watch:flight._js.ClipboardWatch):Void;
	@:native("detachClipboardWatch")
	public static function detachClipboardWatch(watch:flight._js.ClipboardWatch):Void;
	@:native("disposeClipboardWatch")
	public static function disposeClipboardWatch(watch:flight._js.ClipboardWatch):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeClipboardWatch(ptr:flight._js.ClipboardWatch):Void {}
}

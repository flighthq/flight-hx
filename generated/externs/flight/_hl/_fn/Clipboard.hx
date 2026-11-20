package flight._hl._fn;

extern class Clipboard {
	@:hlNative("flight", "flight_create_clipboard_watch")
	public static function createClipboardWatch():flight._hl.ClipboardWatch;
	@:hlNative("flight", "flight_attach_clipboard_watch")
	public static function attachClipboardWatch(hostClipboardChange:flight._hl.HostClipboardChangeSubscriber, watch:flight._hl.ClipboardWatch):Void;
	@:hlNative("flight", "flight_detach_clipboard_watch")
	public static function detachClipboardWatch(watch:flight._hl.ClipboardWatch):Void;
	@:hlNative("flight", "flight_dispose_clipboard_watch")
	public static function disposeClipboardWatch(watch:flight._hl.ClipboardWatch):Void;
	@:hlNative("flight", "flight_free_clipboard_watch")
	public static function freeClipboardWatch(ptr:flight._hl.ClipboardWatch):Void;
}

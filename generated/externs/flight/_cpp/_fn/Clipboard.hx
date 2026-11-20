package flight._cpp._fn;

extern class Clipboard {
	@:native("flight_create_clipboard_watch")
	public static function createClipboardWatch():flight._cpp.ClipboardWatch;
	@:native("flight_attach_clipboard_watch")
	public static function attachClipboardWatch(hostClipboardChange:flight._cpp.HostClipboardChangeSubscriber, watch:flight._cpp.ClipboardWatch):Void;
	@:native("flight_detach_clipboard_watch")
	public static function detachClipboardWatch(watch:flight._cpp.ClipboardWatch):Void;
	@:native("flight_dispose_clipboard_watch")
	public static function disposeClipboardWatch(watch:flight._cpp.ClipboardWatch):Void;
	@:native("flight_free_clipboard_watch")
	public static function freeClipboardWatch(ptr:flight._cpp.ClipboardWatch):Void;
}

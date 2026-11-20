package flight._hl;

private extern class ShellShortcutLink_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_shell_shortcut_link_target")
	static function get_target(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_shell_shortcut_link_target")
	static function set_target(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ShellShortcutLink(hl.Bytes) {
	public var target(get, set):String;
	inline function get_target():String { var raw = ShellShortcutLink_Ffi.get_target(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ShellShortcutLink_Ffi.freeString(raw); return value; }
	inline function set_target(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ShellShortcutLink_Ffi.set_target(this, raw); return value; }
}

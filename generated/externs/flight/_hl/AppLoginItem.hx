package flight._hl;

private extern class AppLoginItem_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_app_login_item_path")
	static function get_path(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_app_login_item_path")
	static function set_path(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract AppLoginItem(hl.Bytes) {
	public var openAtLogin(get, set):Bool;

	inline function get_openAtLogin():Bool return this.getUI8(48) != 0;

	inline function set_openAtLogin(value:Bool):Bool { this.setUI8(48, value ? 1 : 0); return value; }
	public var openAsHidden(get, set):Bool;

	inline function get_openAsHidden():Bool return this.getUI8(49) != 0;

	inline function set_openAsHidden(value:Bool):Bool { this.setUI8(49, value ? 1 : 0); return value; }
	public var path(get, set):String;
	inline function get_path():String { var raw = AppLoginItem_Ffi.get_path(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); AppLoginItem_Ffi.freeString(raw); return value; }
	inline function set_path(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } AppLoginItem_Ffi.set_path(this, raw); return value; }
}

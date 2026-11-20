package flight._hl;

private extern class KeyboardEventData_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_keyboard_event_data_key")
	static function get_key(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_keyboard_event_data_key")
	static function set_key(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract KeyboardEventData(hl.Bytes) {
	public var altKey(get, set):Bool;

	inline function get_altKey():Bool return this.getUI8(28) != 0;

	inline function set_altKey(value:Bool):Bool { this.setUI8(28, value ? 1 : 0); return value; }
	public var ctrlKey(get, set):Bool;

	inline function get_ctrlKey():Bool return this.getUI8(29) != 0;

	inline function set_ctrlKey(value:Bool):Bool { this.setUI8(29, value ? 1 : 0); return value; }
	public var key(get, set):String;
	inline function get_key():String { var raw = KeyboardEventData_Ffi.get_key(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); KeyboardEventData_Ffi.freeString(raw); return value; }
	inline function set_key(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } KeyboardEventData_Ffi.set_key(this, raw); return value; }
	public var keyCode(get, set):Int;

	inline function get_keyCode():Int return this.getI32(24);

	inline function set_keyCode(value:Int):Int { this.setI32(24, value); return value; }
	public var metaKey(get, set):Bool;

	inline function get_metaKey():Bool return this.getUI8(30) != 0;

	inline function set_metaKey(value:Bool):Bool { this.setUI8(30, value ? 1 : 0); return value; }
	public var shiftKey(get, set):Bool;

	inline function get_shiftKey():Bool return this.getUI8(31) != 0;

	inline function set_shiftKey(value:Bool):Bool { this.setUI8(31, value ? 1 : 0); return value; }
}

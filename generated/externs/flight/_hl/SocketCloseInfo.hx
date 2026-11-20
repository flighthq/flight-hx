package flight._hl;

private extern class SocketCloseInfo_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_socket_close_info_reason")
	static function get_reason(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_socket_close_info_reason")
	static function set_reason(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract SocketCloseInfo(hl.Bytes) {
	public var code(get, set):Int;

	inline function get_code():Int return this.getI32(24);

	inline function set_code(value:Int):Int { this.setI32(24, value); return value; }
	public var reason(get, set):String;
	inline function get_reason():String { var raw = SocketCloseInfo_Ffi.get_reason(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); SocketCloseInfo_Ffi.freeString(raw); return value; }
	inline function set_reason(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } SocketCloseInfo_Ffi.set_reason(this, raw); return value; }
	public var wasClean(get, set):Bool;

	inline function get_wasClean():Bool return this.getUI8(28) != 0;

	inline function set_wasClean(value:Bool):Bool { this.setUI8(28, value ? 1 : 0); return value; }
}

package flight._hl;

private extern class TcpSocketOptions_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_tcp_socket_options_host")
	static function get_host(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_tcp_socket_options_host")
	static function set_host(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TcpSocketOptions(hl.Bytes) {
	public var host(get, set):String;
	inline function get_host():String { var raw = TcpSocketOptions_Ffi.get_host(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TcpSocketOptions_Ffi.freeString(raw); return value; }
	inline function set_host(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TcpSocketOptions_Ffi.set_host(this, raw); return value; }
	public var port(get, set):Int;

	inline function get_port():Int return this.getI32(24);

	inline function set_port(value:Int):Int { this.setI32(24, value); return value; }
}

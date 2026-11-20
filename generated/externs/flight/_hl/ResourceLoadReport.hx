package flight._hl;

private extern class ResourceLoadReport_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_resource_load_report_key")
	static function get_key(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_resource_load_report_key")
	static function set_key(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ResourceLoadReport(hl.Bytes) {
	public var attempts(get, set):Int;

	inline function get_attempts():Int return this.getI32(48);

	inline function set_attempts(value:Int):Int { this.setI32(48, value); return value; }
	public var bytes(get, set):Single;

	inline function get_bytes():Single return this.getF32(68);

	inline function set_bytes(value:Single):Single { this.setF32(68, value); return value; }
	public var elapsedMs(get, set):Float;

	inline function get_elapsedMs():Float return this.getF64(56);

	inline function set_elapsedMs(value:Float):Float { this.setF64(56, value); return value; }
	public var key(get, set):String;
	inline function get_key():String { var raw = ResourceLoadReport_Ffi.get_key(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ResourceLoadReport_Ffi.freeString(raw); return value; }
	inline function set_key(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ResourceLoadReport_Ffi.set_key(this, raw); return value; }
}

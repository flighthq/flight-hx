package flight._hl;

private extern class ConnectivityStatus_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_connectivity_status_effective_type")
	static function get_effectiveType(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_connectivity_status_effective_type")
	static function set_effectiveType(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ConnectivityStatus(hl.Bytes) {
	public var downlink(get, set):Single;

	inline function get_downlink():Single return this.getF32(28);

	inline function set_downlink(value:Single):Single { this.setF32(28, value); return value; }
	public var downlinkMax(get, set):Single;

	inline function get_downlinkMax():Single return this.getF32(32);

	inline function set_downlinkMax(value:Single):Single { this.setF32(32, value); return value; }
	public var effectiveType(get, set):String;
	inline function get_effectiveType():String { var raw = ConnectivityStatus_Ffi.get_effectiveType(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ConnectivityStatus_Ffi.freeString(raw); return value; }
	inline function set_effectiveType(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ConnectivityStatus_Ffi.set_effectiveType(this, raw); return value; }
	public var rtt(get, set):Single;

	inline function get_rtt():Single return this.getF32(36);

	inline function set_rtt(value:Single):Single { this.setF32(36, value); return value; }
	public var saveData(get, set):Bool;

	inline function get_saveData():Bool return this.getUI8(40) != 0;

	inline function set_saveData(value:Bool):Bool { this.setUI8(40, value ? 1 : 0); return value; }
	public var metered(get, set):Bool;

	inline function get_metered():Bool return this.getUI8(41) != 0;

	inline function set_metered(value:Bool):Bool { this.setUI8(41, value ? 1 : 0); return value; }
}

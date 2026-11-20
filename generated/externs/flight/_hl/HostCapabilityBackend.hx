package flight._hl;

private extern class HostCapabilityBackend_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_host_capability_backend_entry_point")
	static function get_entryPoint(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_host_capability_backend_entry_point")
	static function set_entryPoint(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_host_capability_backend_package_name")
	static function get_packageName(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_host_capability_backend_package_name")
	static function set_packageName(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_host_capability_backend_platform")
	static function get_platform(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_host_capability_backend_platform")
	static function set_platform(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract HostCapabilityBackend(hl.Bytes) {
	public var entryPoint(get, set):String;
	inline function get_entryPoint():String { var raw = HostCapabilityBackend_Ffi.get_entryPoint(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); HostCapabilityBackend_Ffi.freeString(raw); return value; }
	inline function set_entryPoint(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } HostCapabilityBackend_Ffi.set_entryPoint(this, raw); return value; }
	public var packageName(get, set):String;
	inline function get_packageName():String { var raw = HostCapabilityBackend_Ffi.get_packageName(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); HostCapabilityBackend_Ffi.freeString(raw); return value; }
	inline function set_packageName(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } HostCapabilityBackend_Ffi.set_packageName(this, raw); return value; }
	public var platform(get, set):String;
	inline function get_platform():String { var raw = HostCapabilityBackend_Ffi.get_platform(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); HostCapabilityBackend_Ffi.freeString(raw); return value; }
	inline function set_platform(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } HostCapabilityBackend_Ffi.set_platform(this, raw); return value; }
}

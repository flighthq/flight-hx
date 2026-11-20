package flight._hl;

private extern class PlatformInfo_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_platform_info_version")
	static function get_version(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_platform_info_version")
	static function set_version(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_platform_info_arch")
	static function get_arch(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_platform_info_arch")
	static function set_arch(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_platform_info_locale")
	static function get_locale(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_platform_info_locale")
	static function set_locale(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_platform_info_engine_version")
	static function get_engineVersion(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_platform_info_engine_version")
	static function set_engineVersion(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_platform_info_os_build")
	static function get_osBuild(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_platform_info_os_build")
	static function set_osBuild(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_platform_info_distro")
	static function get_distro(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_platform_info_distro")
	static function set_distro(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_platform_info_distro_version")
	static function get_distroVersion(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_platform_info_distro_version")
	static function set_distroVersion(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract PlatformInfo(hl.Bytes) {
	public var version(get, set):String;
	inline function get_version():String { var raw = PlatformInfo_Ffi.get_version(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); PlatformInfo_Ffi.freeString(raw); return value; }
	inline function set_version(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } PlatformInfo_Ffi.set_version(this, raw); return value; }
	public var arch(get, set):String;
	inline function get_arch():String { var raw = PlatformInfo_Ffi.get_arch(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); PlatformInfo_Ffi.freeString(raw); return value; }
	inline function set_arch(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } PlatformInfo_Ffi.set_arch(this, raw); return value; }
	public var locale(get, set):String;
	inline function get_locale():String { var raw = PlatformInfo_Ffi.get_locale(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); PlatformInfo_Ffi.freeString(raw); return value; }
	inline function set_locale(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } PlatformInfo_Ffi.set_locale(this, raw); return value; }
	public var isTouch(get, set):Bool;

	inline function get_isTouch():Bool return this.getUI8(208) != 0;

	inline function set_isTouch(value:Bool):Bool { this.setUI8(208, value ? 1 : 0); return value; }
	public var engineVersion(get, set):String;
	inline function get_engineVersion():String { var raw = PlatformInfo_Ffi.get_engineVersion(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); PlatformInfo_Ffi.freeString(raw); return value; }
	inline function set_engineVersion(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } PlatformInfo_Ffi.set_engineVersion(this, raw); return value; }
	public var pointerWidth(get, set):Int;

	inline function get_pointerWidth():Int return this.getI32(204);

	inline function set_pointerWidth(value:Int):Int { this.setI32(204, value); return value; }
	public var osBuild(get, set):String;
	inline function get_osBuild():String { var raw = PlatformInfo_Ffi.get_osBuild(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); PlatformInfo_Ffi.freeString(raw); return value; }
	inline function set_osBuild(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } PlatformInfo_Ffi.set_osBuild(this, raw); return value; }
	public var distro(get, set):String;
	inline function get_distro():String { var raw = PlatformInfo_Ffi.get_distro(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); PlatformInfo_Ffi.freeString(raw); return value; }
	inline function set_distro(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } PlatformInfo_Ffi.set_distro(this, raw); return value; }
	public var distroVersion(get, set):String;
	inline function get_distroVersion():String { var raw = PlatformInfo_Ffi.get_distroVersion(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); PlatformInfo_Ffi.freeString(raw); return value; }
	inline function set_distroVersion(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } PlatformInfo_Ffi.set_distroVersion(this, raw); return value; }
}

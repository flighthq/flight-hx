package flight._hl;

private extern class DeviceInfo_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_device_info_arch")
	static function get_arch(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_device_info_arch")
	static function set_arch(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_device_info_board_name")
	static function get_boardName(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_device_info_board_name")
	static function set_boardName(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_device_info_color_gamut")
	static function get_colorGamut(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_device_info_color_gamut")
	static function set_colorGamut(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_device_info_gpu_renderer")
	static function get_gpuRenderer(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_device_info_gpu_renderer")
	static function set_gpuRenderer(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_device_info_gpu_vendor")
	static function get_gpuVendor(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_device_info_gpu_vendor")
	static function set_gpuVendor(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_device_info_manufacturer")
	static function get_manufacturer(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_device_info_manufacturer")
	static function set_manufacturer(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_device_info_marketing_name")
	static function get_marketingName(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_device_info_marketing_name")
	static function set_marketingName(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_device_info_model")
	static function get_model(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_device_info_model")
	static function set_model(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_device_info_os_build")
	static function get_osBuild(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_device_info_os_build")
	static function set_osBuild(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_device_info_os_name")
	static function get_osName(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_device_info_os_name")
	static function set_osName(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_device_info_os_version")
	static function get_osVersion(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_device_info_os_version")
	static function set_osVersion(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_device_info_platform_string")
	static function get_platformString(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_device_info_platform_string")
	static function set_platformString(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_device_info_product_name")
	static function get_productName(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_device_info_product_name")
	static function set_productName(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_device_info_web_view_version")
	static function get_webViewVersion(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_device_info_web_view_version")
	static function set_webViewVersion(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract DeviceInfo(hl.Bytes) {
	public var arch(get, set):String;
	inline function get_arch():String { var raw = DeviceInfo_Ffi.get_arch(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_arch(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DeviceInfo_Ffi.set_arch(this, raw); return value; }
	public var availableMemory(get, set):Float;

	inline function get_availableMemory():Float return this.getF64(384);

	inline function set_availableMemory(value:Float):Float { this.setF64(384, value); return value; }
	public var boardName(get, set):String;
	inline function get_boardName():String { var raw = DeviceInfo_Ffi.get_boardName(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_boardName(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DeviceInfo_Ffi.set_boardName(this, raw); return value; }
	public var colorGamut(get, set):String;
	inline function get_colorGamut():String { var raw = DeviceInfo_Ffi.get_colorGamut(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_colorGamut(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DeviceInfo_Ffi.set_colorGamut(this, raw); return value; }
	public var cpuCores(get, set):Int;

	inline function get_cpuCores():Int return this.getI32(400);

	inline function set_cpuCores(value:Int):Int { this.setI32(400, value); return value; }
	public var fontScale(get, set):Single;

	inline function get_fontScale():Single return this.getF32(404);

	inline function set_fontScale(value:Single):Single { this.setF32(404, value); return value; }
	public var gpuRenderer(get, set):String;
	inline function get_gpuRenderer():String { var raw = DeviceInfo_Ffi.get_gpuRenderer(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_gpuRenderer(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DeviceInfo_Ffi.set_gpuRenderer(this, raw); return value; }
	public var gpuVendor(get, set):String;
	inline function get_gpuVendor():String { var raw = DeviceInfo_Ffi.get_gpuVendor(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_gpuVendor(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DeviceInfo_Ffi.set_gpuVendor(this, raw); return value; }
	public var isHdr(get, set):Bool;

	inline function get_isHdr():Bool return this.getUI8(408) != 0;

	inline function set_isHdr(value:Bool):Bool { this.setUI8(408, value ? 1 : 0); return value; }
	public var isJailbroken(get, set):Bool;

	inline function get_isJailbroken():Bool return this.getUI8(409) != 0;

	inline function set_isJailbroken(value:Bool):Bool { this.setUI8(409, value ? 1 : 0); return value; }
	public var isLowEndDevice(get, set):Bool;

	inline function get_isLowEndDevice():Bool return this.getUI8(410) != 0;

	inline function set_isLowEndDevice(value:Bool):Bool { this.setUI8(410, value ? 1 : 0); return value; }
	public var isRooted(get, set):Bool;

	inline function get_isRooted():Bool return this.getUI8(411) != 0;

	inline function set_isRooted(value:Bool):Bool { this.setUI8(411, value ? 1 : 0); return value; }
	public var isVirtual(get, set):Bool;

	inline function get_isVirtual():Bool return this.getUI8(412) != 0;

	inline function set_isVirtual(value:Bool):Bool { this.setUI8(412, value ? 1 : 0); return value; }
	public var manufacturer(get, set):String;
	inline function get_manufacturer():String { var raw = DeviceInfo_Ffi.get_manufacturer(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_manufacturer(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DeviceInfo_Ffi.set_manufacturer(this, raw); return value; }
	public var marketingName(get, set):String;
	inline function get_marketingName():String { var raw = DeviceInfo_Ffi.get_marketingName(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_marketingName(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DeviceInfo_Ffi.set_marketingName(this, raw); return value; }
	public var model(get, set):String;
	inline function get_model():String { var raw = DeviceInfo_Ffi.get_model(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_model(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DeviceInfo_Ffi.set_model(this, raw); return value; }
	public var osBuild(get, set):String;
	inline function get_osBuild():String { var raw = DeviceInfo_Ffi.get_osBuild(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_osBuild(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DeviceInfo_Ffi.set_osBuild(this, raw); return value; }
	public var osName(get, set):String;
	inline function get_osName():String { var raw = DeviceInfo_Ffi.get_osName(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_osName(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DeviceInfo_Ffi.set_osName(this, raw); return value; }
	public var osVersion(get, set):String;
	inline function get_osVersion():String { var raw = DeviceInfo_Ffi.get_osVersion(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_osVersion(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DeviceInfo_Ffi.set_osVersion(this, raw); return value; }
	public var platformString(get, set):String;
	inline function get_platformString():String { var raw = DeviceInfo_Ffi.get_platformString(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_platformString(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DeviceInfo_Ffi.set_platformString(this, raw); return value; }
	public var productName(get, set):String;
	inline function get_productName():String { var raw = DeviceInfo_Ffi.get_productName(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_productName(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DeviceInfo_Ffi.set_productName(this, raw); return value; }
	public var totalMemory(get, set):Float;

	inline function get_totalMemory():Float return this.getF64(392);

	inline function set_totalMemory(value:Float):Float { this.setF64(392, value); return value; }
	public var webViewVersion(get, set):String;
	inline function get_webViewVersion():String { var raw = DeviceInfo_Ffi.get_webViewVersion(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_webViewVersion(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } DeviceInfo_Ffi.set_webViewVersion(this, raw); return value; }
}

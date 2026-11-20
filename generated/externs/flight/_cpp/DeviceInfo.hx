package flight._cpp;

private extern class DeviceInfo_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_device_info_arch") static function get_arch(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_device_info_arch") static function set_arch(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_device_info_available_memory") static function get_availableMemory(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_device_info_available_memory") static function set_availableMemory(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_device_info_board_name") static function get_boardName(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_device_info_board_name") static function set_boardName(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_device_info_color_gamut") static function get_colorGamut(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_device_info_color_gamut") static function set_colorGamut(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_device_info_cpu_cores") static function get_cpuCores(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_device_info_cpu_cores") static function set_cpuCores(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_device_info_font_scale") static function get_fontScale(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_device_info_font_scale") static function set_fontScale(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_device_info_gpu_renderer") static function get_gpuRenderer(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_device_info_gpu_renderer") static function set_gpuRenderer(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_device_info_gpu_vendor") static function get_gpuVendor(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_device_info_gpu_vendor") static function set_gpuVendor(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_device_info_is_hdr") static function get_isHdr(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_device_info_is_hdr") static function set_isHdr(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_device_info_is_jailbroken") static function get_isJailbroken(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_device_info_is_jailbroken") static function set_isJailbroken(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_device_info_is_low_end_device") static function get_isLowEndDevice(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_device_info_is_low_end_device") static function set_isLowEndDevice(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_device_info_is_rooted") static function get_isRooted(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_device_info_is_rooted") static function set_isRooted(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_device_info_is_virtual") static function get_isVirtual(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_device_info_is_virtual") static function set_isVirtual(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_field_get_device_info_manufacturer") static function get_manufacturer(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_device_info_manufacturer") static function set_manufacturer(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_device_info_marketing_name") static function get_marketingName(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_device_info_marketing_name") static function set_marketingName(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_device_info_model") static function get_model(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_device_info_model") static function set_model(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_device_info_os_build") static function get_osBuild(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_device_info_os_build") static function set_osBuild(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_device_info_os_name") static function get_osName(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_device_info_os_name") static function set_osName(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_device_info_os_version") static function get_osVersion(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_device_info_os_version") static function set_osVersion(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_device_info_platform_string") static function get_platformString(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_device_info_platform_string") static function set_platformString(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_device_info_product_name") static function get_productName(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_device_info_product_name") static function set_productName(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_device_info_total_memory") static function get_totalMemory(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_device_info_total_memory") static function set_totalMemory(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_device_info_web_view_version") static function get_webViewVersion(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_device_info_web_view_version") static function set_webViewVersion(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract DeviceInfo(cpp.Star<cpp.Void>) {
	public var arch(get, set):String;
	inline function get_arch():String { var raw = DeviceInfo_Ffi.get_arch(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_arch(value:String):String { var raw:cpp.ConstCharStar = cast value; DeviceInfo_Ffi.set_arch(this, raw); return value; }
	public var availableMemory(get, set):Float;

	inline function get_availableMemory():Float return DeviceInfo_Ffi.get_availableMemory(this);

	inline function set_availableMemory(value:Float):Float { DeviceInfo_Ffi.set_availableMemory(this, value); return value; }
	public var boardName(get, set):String;
	inline function get_boardName():String { var raw = DeviceInfo_Ffi.get_boardName(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_boardName(value:String):String { var raw:cpp.ConstCharStar = cast value; DeviceInfo_Ffi.set_boardName(this, raw); return value; }
	public var colorGamut(get, set):String;
	inline function get_colorGamut():String { var raw = DeviceInfo_Ffi.get_colorGamut(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_colorGamut(value:String):String { var raw:cpp.ConstCharStar = cast value; DeviceInfo_Ffi.set_colorGamut(this, raw); return value; }
	public var cpuCores(get, set):Int;

	inline function get_cpuCores():Int return DeviceInfo_Ffi.get_cpuCores(this);

	inline function set_cpuCores(value:Int):Int { DeviceInfo_Ffi.set_cpuCores(this, value); return value; }
	public var fontScale(get, set):Single;

	inline function get_fontScale():Single return DeviceInfo_Ffi.get_fontScale(this);

	inline function set_fontScale(value:Single):Single { DeviceInfo_Ffi.set_fontScale(this, value); return value; }
	public var gpuRenderer(get, set):String;
	inline function get_gpuRenderer():String { var raw = DeviceInfo_Ffi.get_gpuRenderer(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_gpuRenderer(value:String):String { var raw:cpp.ConstCharStar = cast value; DeviceInfo_Ffi.set_gpuRenderer(this, raw); return value; }
	public var gpuVendor(get, set):String;
	inline function get_gpuVendor():String { var raw = DeviceInfo_Ffi.get_gpuVendor(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_gpuVendor(value:String):String { var raw:cpp.ConstCharStar = cast value; DeviceInfo_Ffi.set_gpuVendor(this, raw); return value; }
	public var isHdr(get, set):Bool;

	inline function get_isHdr():Bool return DeviceInfo_Ffi.get_isHdr(this);

	inline function set_isHdr(value:Bool):Bool { DeviceInfo_Ffi.set_isHdr(this, value); return value; }
	public var isJailbroken(get, set):Bool;

	inline function get_isJailbroken():Bool return DeviceInfo_Ffi.get_isJailbroken(this);

	inline function set_isJailbroken(value:Bool):Bool { DeviceInfo_Ffi.set_isJailbroken(this, value); return value; }
	public var isLowEndDevice(get, set):Bool;

	inline function get_isLowEndDevice():Bool return DeviceInfo_Ffi.get_isLowEndDevice(this);

	inline function set_isLowEndDevice(value:Bool):Bool { DeviceInfo_Ffi.set_isLowEndDevice(this, value); return value; }
	public var isRooted(get, set):Bool;

	inline function get_isRooted():Bool return DeviceInfo_Ffi.get_isRooted(this);

	inline function set_isRooted(value:Bool):Bool { DeviceInfo_Ffi.set_isRooted(this, value); return value; }
	public var isVirtual(get, set):Bool;

	inline function get_isVirtual():Bool return DeviceInfo_Ffi.get_isVirtual(this);

	inline function set_isVirtual(value:Bool):Bool { DeviceInfo_Ffi.set_isVirtual(this, value); return value; }
	public var manufacturer(get, set):String;
	inline function get_manufacturer():String { var raw = DeviceInfo_Ffi.get_manufacturer(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_manufacturer(value:String):String { var raw:cpp.ConstCharStar = cast value; DeviceInfo_Ffi.set_manufacturer(this, raw); return value; }
	public var marketingName(get, set):String;
	inline function get_marketingName():String { var raw = DeviceInfo_Ffi.get_marketingName(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_marketingName(value:String):String { var raw:cpp.ConstCharStar = cast value; DeviceInfo_Ffi.set_marketingName(this, raw); return value; }
	public var model(get, set):String;
	inline function get_model():String { var raw = DeviceInfo_Ffi.get_model(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_model(value:String):String { var raw:cpp.ConstCharStar = cast value; DeviceInfo_Ffi.set_model(this, raw); return value; }
	public var osBuild(get, set):String;
	inline function get_osBuild():String { var raw = DeviceInfo_Ffi.get_osBuild(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_osBuild(value:String):String { var raw:cpp.ConstCharStar = cast value; DeviceInfo_Ffi.set_osBuild(this, raw); return value; }
	public var osName(get, set):String;
	inline function get_osName():String { var raw = DeviceInfo_Ffi.get_osName(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_osName(value:String):String { var raw:cpp.ConstCharStar = cast value; DeviceInfo_Ffi.set_osName(this, raw); return value; }
	public var osVersion(get, set):String;
	inline function get_osVersion():String { var raw = DeviceInfo_Ffi.get_osVersion(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_osVersion(value:String):String { var raw:cpp.ConstCharStar = cast value; DeviceInfo_Ffi.set_osVersion(this, raw); return value; }
	public var platformString(get, set):String;
	inline function get_platformString():String { var raw = DeviceInfo_Ffi.get_platformString(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_platformString(value:String):String { var raw:cpp.ConstCharStar = cast value; DeviceInfo_Ffi.set_platformString(this, raw); return value; }
	public var productName(get, set):String;
	inline function get_productName():String { var raw = DeviceInfo_Ffi.get_productName(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_productName(value:String):String { var raw:cpp.ConstCharStar = cast value; DeviceInfo_Ffi.set_productName(this, raw); return value; }
	public var totalMemory(get, set):Float;

	inline function get_totalMemory():Float return DeviceInfo_Ffi.get_totalMemory(this);

	inline function set_totalMemory(value:Float):Float { DeviceInfo_Ffi.set_totalMemory(this, value); return value; }
	public var webViewVersion(get, set):String;
	inline function get_webViewVersion():String { var raw = DeviceInfo_Ffi.get_webViewVersion(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DeviceInfo_Ffi.freeString(raw); return value; }
	inline function set_webViewVersion(value:String):String { var raw:cpp.ConstCharStar = cast value; DeviceInfo_Ffi.set_webViewVersion(this, raw); return value; }
}

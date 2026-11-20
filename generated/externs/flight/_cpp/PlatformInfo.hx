package flight._cpp;

private extern class PlatformInfo_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_platform_info_version") static function get_version(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_platform_info_version") static function set_version(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_platform_info_arch") static function get_arch(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_platform_info_arch") static function set_arch(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_platform_info_locale") static function get_locale(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_platform_info_locale") static function set_locale(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_platform_info_is_touch") static function get_isTouch(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_platform_info_is_touch") static function set_isTouch(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_field_get_platform_info_engine_version") static function get_engineVersion(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_platform_info_engine_version") static function set_engineVersion(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_platform_info_pointer_width") static function get_pointerWidth(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_platform_info_pointer_width") static function set_pointerWidth(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_platform_info_os_build") static function get_osBuild(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_platform_info_os_build") static function set_osBuild(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_platform_info_distro") static function get_distro(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_platform_info_distro") static function set_distro(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_platform_info_distro_version") static function get_distroVersion(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_platform_info_distro_version") static function set_distroVersion(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract PlatformInfo(cpp.Star<cpp.Void>) {
	public var version(get, set):String;
	inline function get_version():String { var raw = PlatformInfo_Ffi.get_version(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); PlatformInfo_Ffi.freeString(raw); return value; }
	inline function set_version(value:String):String { var raw:cpp.ConstCharStar = cast value; PlatformInfo_Ffi.set_version(this, raw); return value; }
	public var arch(get, set):String;
	inline function get_arch():String { var raw = PlatformInfo_Ffi.get_arch(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); PlatformInfo_Ffi.freeString(raw); return value; }
	inline function set_arch(value:String):String { var raw:cpp.ConstCharStar = cast value; PlatformInfo_Ffi.set_arch(this, raw); return value; }
	public var locale(get, set):String;
	inline function get_locale():String { var raw = PlatformInfo_Ffi.get_locale(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); PlatformInfo_Ffi.freeString(raw); return value; }
	inline function set_locale(value:String):String { var raw:cpp.ConstCharStar = cast value; PlatformInfo_Ffi.set_locale(this, raw); return value; }
	public var isTouch(get, set):Bool;

	inline function get_isTouch():Bool return PlatformInfo_Ffi.get_isTouch(this);

	inline function set_isTouch(value:Bool):Bool { PlatformInfo_Ffi.set_isTouch(this, value); return value; }
	public var engineVersion(get, set):String;
	inline function get_engineVersion():String { var raw = PlatformInfo_Ffi.get_engineVersion(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); PlatformInfo_Ffi.freeString(raw); return value; }
	inline function set_engineVersion(value:String):String { var raw:cpp.ConstCharStar = cast value; PlatformInfo_Ffi.set_engineVersion(this, raw); return value; }
	public var pointerWidth(get, set):Int;

	inline function get_pointerWidth():Int return PlatformInfo_Ffi.get_pointerWidth(this);

	inline function set_pointerWidth(value:Int):Int { PlatformInfo_Ffi.set_pointerWidth(this, value); return value; }
	public var osBuild(get, set):String;
	inline function get_osBuild():String { var raw = PlatformInfo_Ffi.get_osBuild(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); PlatformInfo_Ffi.freeString(raw); return value; }
	inline function set_osBuild(value:String):String { var raw:cpp.ConstCharStar = cast value; PlatformInfo_Ffi.set_osBuild(this, raw); return value; }
	public var distro(get, set):String;
	inline function get_distro():String { var raw = PlatformInfo_Ffi.get_distro(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); PlatformInfo_Ffi.freeString(raw); return value; }
	inline function set_distro(value:String):String { var raw:cpp.ConstCharStar = cast value; PlatformInfo_Ffi.set_distro(this, raw); return value; }
	public var distroVersion(get, set):String;
	inline function get_distroVersion():String { var raw = PlatformInfo_Ffi.get_distroVersion(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); PlatformInfo_Ffi.freeString(raw); return value; }
	inline function set_distroVersion(value:String):String { var raw:cpp.ConstCharStar = cast value; PlatformInfo_Ffi.set_distroVersion(this, raw); return value; }
}

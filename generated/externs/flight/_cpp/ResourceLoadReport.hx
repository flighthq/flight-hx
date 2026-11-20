package flight._cpp;

private extern class ResourceLoadReport_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_resource_load_report_attempts") static function get_attempts(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_resource_load_report_attempts") static function set_attempts(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_resource_load_report_bytes") static function get_bytes(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_resource_load_report_bytes") static function set_bytes(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_resource_load_report_elapsed_ms") static function get_elapsedMs(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_resource_load_report_elapsed_ms") static function set_elapsedMs(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_resource_load_report_key") static function get_key(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_resource_load_report_key") static function set_key(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ResourceLoadReport(cpp.Star<cpp.Void>) {
	public var attempts(get, set):Int;

	inline function get_attempts():Int return ResourceLoadReport_Ffi.get_attempts(this);

	inline function set_attempts(value:Int):Int { ResourceLoadReport_Ffi.set_attempts(this, value); return value; }
	public var bytes(get, set):Single;

	inline function get_bytes():Single return ResourceLoadReport_Ffi.get_bytes(this);

	inline function set_bytes(value:Single):Single { ResourceLoadReport_Ffi.set_bytes(this, value); return value; }
	public var elapsedMs(get, set):Float;

	inline function get_elapsedMs():Float return ResourceLoadReport_Ffi.get_elapsedMs(this);

	inline function set_elapsedMs(value:Float):Float { ResourceLoadReport_Ffi.set_elapsedMs(this, value); return value; }
	public var key(get, set):String;
	inline function get_key():String { var raw = ResourceLoadReport_Ffi.get_key(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ResourceLoadReport_Ffi.freeString(raw); return value; }
	inline function set_key(value:String):String { var raw:cpp.ConstCharStar = cast value; ResourceLoadReport_Ffi.set_key(this, raw); return value; }
}

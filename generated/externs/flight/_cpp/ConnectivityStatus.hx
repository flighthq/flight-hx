package flight._cpp;

private extern class ConnectivityStatus_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_connectivity_status_downlink") static function get_downlink(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_connectivity_status_downlink") static function set_downlink(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_connectivity_status_downlink_max") static function get_downlinkMax(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_connectivity_status_downlink_max") static function set_downlinkMax(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_connectivity_status_effective_type") static function get_effectiveType(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_connectivity_status_effective_type") static function set_effectiveType(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_connectivity_status_rtt") static function get_rtt(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_connectivity_status_rtt") static function set_rtt(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_connectivity_status_save_data") static function get_saveData(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_connectivity_status_save_data") static function set_saveData(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_connectivity_status_metered") static function get_metered(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_connectivity_status_metered") static function set_metered(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract ConnectivityStatus(cpp.Star<cpp.Void>) {
	public var downlink(get, set):Single;

	inline function get_downlink():Single return ConnectivityStatus_Ffi.get_downlink(this);

	inline function set_downlink(value:Single):Single { ConnectivityStatus_Ffi.set_downlink(this, value); return value; }
	public var downlinkMax(get, set):Single;

	inline function get_downlinkMax():Single return ConnectivityStatus_Ffi.get_downlinkMax(this);

	inline function set_downlinkMax(value:Single):Single { ConnectivityStatus_Ffi.set_downlinkMax(this, value); return value; }
	public var effectiveType(get, set):String;
	inline function get_effectiveType():String { var raw = ConnectivityStatus_Ffi.get_effectiveType(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ConnectivityStatus_Ffi.freeString(raw); return value; }
	inline function set_effectiveType(value:String):String { var raw:cpp.ConstCharStar = cast value; ConnectivityStatus_Ffi.set_effectiveType(this, raw); return value; }
	public var rtt(get, set):Single;

	inline function get_rtt():Single return ConnectivityStatus_Ffi.get_rtt(this);

	inline function set_rtt(value:Single):Single { ConnectivityStatus_Ffi.set_rtt(this, value); return value; }
	public var saveData(get, set):Bool;

	inline function get_saveData():Bool return ConnectivityStatus_Ffi.get_saveData(this);

	inline function set_saveData(value:Bool):Bool { ConnectivityStatus_Ffi.set_saveData(this, value); return value; }
	public var metered(get, set):Bool;

	inline function get_metered():Bool return ConnectivityStatus_Ffi.get_metered(this);

	inline function set_metered(value:Bool):Bool { ConnectivityStatus_Ffi.set_metered(this, value); return value; }
}

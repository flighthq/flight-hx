package flight._cpp;

private extern class ThreeDsDropTally_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_three_ds_drop_tally_count") static function get_count(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_three_ds_drop_tally_count") static function set_count(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_three_ds_drop_tally_kind") static function get_kind(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_three_ds_drop_tally_kind") static function set_kind(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ThreeDsDropTally(cpp.Star<cpp.Void>) {
	public var count(get, set):Int;

	inline function get_count():Int return ThreeDsDropTally_Ffi.get_count(this);

	inline function set_count(value:Int):Int { ThreeDsDropTally_Ffi.set_count(this, value); return value; }
	public var kind(get, set):String;
	inline function get_kind():String { var raw = ThreeDsDropTally_Ffi.get_kind(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ThreeDsDropTally_Ffi.freeString(raw); return value; }
	inline function set_kind(value:String):String { var raw:cpp.ConstCharStar = cast value; ThreeDsDropTally_Ffi.set_kind(this, raw); return value; }
}

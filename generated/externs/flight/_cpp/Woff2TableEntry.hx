package flight._cpp;

private extern class Woff2TableEntry_Ffi {
	@:native("flight_get_woff2_table_entry_original_length") static function get_originalLength(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_woff2_table_entry_original_length") static function set_originalLength(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_woff2_table_entry_tag")
	static function get_tag(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_woff2_table_entry_tag")
	static function set_tag(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_woff2_table_entry_transform_length") static function get_transformLength(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_woff2_table_entry_transform_length") static function set_transformLength(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_woff2_table_entry_transform_version") static function get_transformVersion(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_woff2_table_entry_transform_version") static function set_transformVersion(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_woff2_table_entry_transformed") static function get_transformed(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_woff2_table_entry_transformed") static function set_transformed(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Woff2TableEntry(cpp.Star<cpp.Void>) {
	public var originalLength(get, set):Int;

	inline function get_originalLength():Int return Woff2TableEntry_Ffi.get_originalLength(this);

	inline function set_originalLength(value:Int):Int { Woff2TableEntry_Ffi.set_originalLength(this, value); return value; }
	public var tag(get, set):String;
	inline function get_tag():String {
		final bytes = Woff2TableEntry_Ffi.get_tag(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_tag(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Woff2TableEntry_Ffi.set_tag(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var transformLength(get, set):Int;

	inline function get_transformLength():Int return Woff2TableEntry_Ffi.get_transformLength(this);

	inline function set_transformLength(value:Int):Int { Woff2TableEntry_Ffi.set_transformLength(this, value); return value; }
	public var transformVersion(get, set):Int;

	inline function get_transformVersion():Int return Woff2TableEntry_Ffi.get_transformVersion(this);

	inline function set_transformVersion(value:Int):Int { Woff2TableEntry_Ffi.set_transformVersion(this, value); return value; }
	public var transformed(get, set):Bool;

	inline function get_transformed():Bool return Woff2TableEntry_Ffi.get_transformed(this);

	inline function set_transformed(value:Bool):Bool { Woff2TableEntry_Ffi.set_transformed(this, value); return value; }
}

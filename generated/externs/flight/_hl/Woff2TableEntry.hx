package flight._hl;

private extern class Woff2TableEntry_Ffi {
	@:hlNative("flight", "flight_field_get_woff2_table_entry_tag")
	static function get_tag(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_woff2_table_entry_tag")
	static function set_tag(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Woff2TableEntry(hl.Bytes) {
	public var originalLength(get, set):Int;

	inline function get_originalLength():Int return this.getI32(24);

	inline function set_originalLength(value:Int):Int { this.setI32(24, value); return value; }
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
		Woff2TableEntry_Ffi.set_tag(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var transformLength(get, set):Int;

	inline function get_transformLength():Int return this.getI32(32);

	inline function set_transformLength(value:Int):Int { this.setI32(32, value); return value; }
	public var transformVersion(get, set):Int;

	inline function get_transformVersion():Int return this.getUI8(41);

	inline function set_transformVersion(value:Int):Int { this.setUI8(41, value); return value; }
	public var transformed(get, set):Bool;

	inline function get_transformed():Bool return this.getUI8(40) != 0;

	inline function set_transformed(value:Bool):Bool { this.setUI8(40, value ? 1 : 0); return value; }
}

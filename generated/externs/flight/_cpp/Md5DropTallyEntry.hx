package flight._cpp;

private extern class Md5DropTallyEntry_Ffi {
	@:native("flight_field_get_md5_drop_tally_entry_key")
	static function get_key(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_md5_drop_tally_entry_key")
	static function set_key(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract Md5DropTallyEntry(cpp.Star<cpp.Void>) {
	public var key(get, set):String;
	inline function get_key():String {
		final bytes = Md5DropTallyEntry_Ffi.get_key(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_key(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Md5DropTallyEntry_Ffi.set_key(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}

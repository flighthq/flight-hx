package flight._cpp;

private extern class ThreeDsMaterialEntry_Ffi {
	@:native("flight_field_get_three_ds_material_entry_key")
	static function get_key(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_three_ds_material_entry_key")
	static function set_key(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract ThreeDsMaterialEntry(cpp.Star<cpp.Void>) {
	public var key(get, set):String;
	inline function get_key():String {
		final bytes = ThreeDsMaterialEntry_Ffi.get_key(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_key(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ThreeDsMaterialEntry_Ffi.set_key(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}

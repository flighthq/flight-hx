package flight._hl;

private extern class ThreeDsMaterialGroup_Ffi {
	@:hlNative("flight", "flight_field_get_three_ds_material_group_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_three_ds_material_group_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ThreeDsMaterialGroup(hl.Bytes) {
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = ThreeDsMaterialGroup_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ThreeDsMaterialGroup_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}

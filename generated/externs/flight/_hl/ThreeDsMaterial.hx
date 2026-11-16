package flight._hl;

private extern class ThreeDsMaterial_Ffi {
	@:hlNative("flight", "flight_field_get_three_ds_material_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_three_ds_material_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ThreeDsMaterial(hl.Bytes) {
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = ThreeDsMaterial_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ThreeDsMaterial_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var opacity(get, set):Single;

	inline function get_opacity():Single return this.getF32(128);

	inline function set_opacity(value:Single):Single { this.setF32(128, value); return value; }
}

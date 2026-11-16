package flight._hl;

private extern class StarlingSubTexture_Ffi {
	@:hlNative("flight", "flight_field_get_starling_sub_texture_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_starling_sub_texture_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract StarlingSubTexture(hl.Bytes) {
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(32);

	inline function set_height(value:Single):Single { this.setF32(32, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = StarlingSubTexture_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		StarlingSubTexture_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(84);

	inline function set_width(value:Single):Single { this.setF32(84, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(88);

	inline function set_x(value:Single):Single { this.setF32(88, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(92);

	inline function set_y(value:Single):Single { this.setF32(92, value); return value; }
}

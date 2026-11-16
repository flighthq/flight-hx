package flight._hl;

private extern class ThreeDsLight_Ffi {
	@:hlNative("flight", "flight_field_get_three_ds_light_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_three_ds_light_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ThreeDsLight(hl.Bytes) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(92) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(92, value ? 1 : 0); return value; }
	public var falloff(get, set):Single;

	inline function get_falloff():Single return this.getF32(68);

	inline function set_falloff(value:Single):Single { this.setF32(68, value); return value; }
	public var hotspot(get, set):Single;

	inline function get_hotspot():Single return this.getF32(72);

	inline function set_hotspot(value:Single):Single { this.setF32(72, value); return value; }
	public var multiplier(get, set):Single;

	inline function get_multiplier():Single return this.getF32(76);

	inline function set_multiplier(value:Single):Single { this.setF32(76, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = ThreeDsLight_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ThreeDsLight_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}

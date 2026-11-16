package flight._hl;

private extern class ColladaSkinInfluence_Ffi {
	@:hlNative("flight", "flight_field_get_collada_skin_influence_joint")
	static function get_joint(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_collada_skin_influence_joint")
	static function set_joint(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ColladaSkinInfluence(hl.Bytes) {
	public var joint(get, set):String;
	inline function get_joint():String {
		final bytes = ColladaSkinInfluence_Ffi.get_joint(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_joint(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ColladaSkinInfluence_Ffi.set_joint(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var weight(get, set):Single;

	inline function get_weight():Single return this.getF32(24);

	inline function set_weight(value:Single):Single { this.setF32(24, value); return value; }
}

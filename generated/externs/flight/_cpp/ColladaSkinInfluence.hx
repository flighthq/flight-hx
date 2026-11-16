package flight._cpp;

private extern class ColladaSkinInfluence_Ffi {
	@:native("flight_field_get_collada_skin_influence_joint")
	static function get_joint(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_collada_skin_influence_joint")
	static function set_joint(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_collada_skin_influence_weight") static function get_weight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_collada_skin_influence_weight") static function set_weight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ColladaSkinInfluence(cpp.Star<cpp.Void>) {
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
		ColladaSkinInfluence_Ffi.set_joint(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var weight(get, set):Single;

	inline function get_weight():Single return ColladaSkinInfluence_Ffi.get_weight(this);

	inline function set_weight(value:Single):Single { ColladaSkinInfluence_Ffi.set_weight(this, value); return value; }
}

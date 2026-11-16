package flight._hl;

private extern class Skeleton2DAnimationTarget_Ffi {
	@:hlNative("flight", "flight_field_get_skeleton2_danimation_target_path")
	static function get_path(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_skeleton2_danimation_target_path")
	static function set_path(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Skeleton2DAnimationTarget(hl.Bytes) {
	public var boneIndex(get, set):Int;

	inline function get_boneIndex():Int return this.getI32(16);

	inline function set_boneIndex(value:Int):Int { this.setI32(16, value); return value; }
	public var path(get, set):String;
	inline function get_path():String {
		final bytes = Skeleton2DAnimationTarget_Ffi.get_path(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_path(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Skeleton2DAnimationTarget_Ffi.set_path(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}

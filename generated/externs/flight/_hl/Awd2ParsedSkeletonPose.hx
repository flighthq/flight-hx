package flight._hl;

private extern class Awd2ParsedSkeletonPose_Ffi {
	@:hlNative("flight", "flight_field_get_awd2_parsed_skeleton_pose_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_awd2_parsed_skeleton_pose_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Awd2ParsedSkeletonPose(hl.Bytes) {
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = Awd2ParsedSkeletonPose_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Awd2ParsedSkeletonPose_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}

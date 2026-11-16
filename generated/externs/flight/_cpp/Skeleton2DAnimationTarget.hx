package flight._cpp;

private extern class Skeleton2DAnimationTarget_Ffi {
	@:native("flight_get_skeleton2_danimation_target_bone_index") static function get_boneIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_skeleton2_danimation_target_bone_index") static function set_boneIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_skeleton2_danimation_target_path")
	static function get_path(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_skeleton2_danimation_target_path")
	static function set_path(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract Skeleton2DAnimationTarget(cpp.Star<cpp.Void>) {
	public var boneIndex(get, set):Int;

	inline function get_boneIndex():Int return Skeleton2DAnimationTarget_Ffi.get_boneIndex(this);

	inline function set_boneIndex(value:Int):Int { Skeleton2DAnimationTarget_Ffi.set_boneIndex(this, value); return value; }
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
		Skeleton2DAnimationTarget_Ffi.set_path(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}

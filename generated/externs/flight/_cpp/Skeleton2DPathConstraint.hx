package flight._cpp;

private extern class Skeleton2DPathConstraint_Ffi {
	@:native("flight_get_skeleton2_dpath_constraint_mix") static function get_mix(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dpath_constraint_mix") static function set_mix(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dpath_constraint_mix_rotate") static function get_mixRotate(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dpath_constraint_mix_rotate") static function set_mixRotate(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dpath_constraint_mix_x") static function get_mixX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dpath_constraint_mix_x") static function set_mixX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dpath_constraint_mix_y") static function get_mixY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dpath_constraint_mix_y") static function set_mixY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dpath_constraint_position") static function get_position(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dpath_constraint_position") static function set_position(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_skeleton2_dpath_constraint_position_mode")
	static function get_positionMode(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_skeleton2_dpath_constraint_position_mode")
	static function set_positionMode(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_skeleton2_dpath_constraint_rotate_mode")
	static function get_rotateMode(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_skeleton2_dpath_constraint_rotate_mode")
	static function set_rotateMode(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_skeleton2_dpath_constraint_spacing") static function get_spacing(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dpath_constraint_spacing") static function set_spacing(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_skeleton2_dpath_constraint_spacing_mode")
	static function get_spacingMode(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_skeleton2_dpath_constraint_spacing_mode")
	static function set_spacingMode(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_skeleton2_dpath_constraint_target_slot_index") static function get_targetSlotIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_skeleton2_dpath_constraint_target_slot_index") static function set_targetSlotIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Skeleton2DPathConstraint(cpp.Star<cpp.Void>) {
	public var mix(get, set):Single;

	inline function get_mix():Single return Skeleton2DPathConstraint_Ffi.get_mix(this);

	inline function set_mix(value:Single):Single { Skeleton2DPathConstraint_Ffi.set_mix(this, value); return value; }
	public var mixRotate(get, set):Single;

	inline function get_mixRotate():Single return Skeleton2DPathConstraint_Ffi.get_mixRotate(this);

	inline function set_mixRotate(value:Single):Single { Skeleton2DPathConstraint_Ffi.set_mixRotate(this, value); return value; }
	public var mixX(get, set):Single;

	inline function get_mixX():Single return Skeleton2DPathConstraint_Ffi.get_mixX(this);

	inline function set_mixX(value:Single):Single { Skeleton2DPathConstraint_Ffi.set_mixX(this, value); return value; }
	public var mixY(get, set):Single;

	inline function get_mixY():Single return Skeleton2DPathConstraint_Ffi.get_mixY(this);

	inline function set_mixY(value:Single):Single { Skeleton2DPathConstraint_Ffi.set_mixY(this, value); return value; }
	public var position(get, set):Single;

	inline function get_position():Single return Skeleton2DPathConstraint_Ffi.get_position(this);

	inline function set_position(value:Single):Single { Skeleton2DPathConstraint_Ffi.set_position(this, value); return value; }
	public var positionMode(get, set):String;
	inline function get_positionMode():String {
		final bytes = Skeleton2DPathConstraint_Ffi.get_positionMode(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_positionMode(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Skeleton2DPathConstraint_Ffi.set_positionMode(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var rotateMode(get, set):String;
	inline function get_rotateMode():String {
		final bytes = Skeleton2DPathConstraint_Ffi.get_rotateMode(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_rotateMode(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Skeleton2DPathConstraint_Ffi.set_rotateMode(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var spacing(get, set):Single;

	inline function get_spacing():Single return Skeleton2DPathConstraint_Ffi.get_spacing(this);

	inline function set_spacing(value:Single):Single { Skeleton2DPathConstraint_Ffi.set_spacing(this, value); return value; }
	public var spacingMode(get, set):String;
	inline function get_spacingMode():String {
		final bytes = Skeleton2DPathConstraint_Ffi.get_spacingMode(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_spacingMode(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Skeleton2DPathConstraint_Ffi.set_spacingMode(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var targetSlotIndex(get, set):Int;

	inline function get_targetSlotIndex():Int return Skeleton2DPathConstraint_Ffi.get_targetSlotIndex(this);

	inline function set_targetSlotIndex(value:Int):Int { Skeleton2DPathConstraint_Ffi.set_targetSlotIndex(this, value); return value; }
}

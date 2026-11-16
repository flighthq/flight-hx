package flight._hl;

private extern class Skeleton2DPathConstraint_Ffi {
	@:hlNative("flight", "flight_field_get_skeleton2_dpath_constraint_position_mode")
	static function get_positionMode(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_skeleton2_dpath_constraint_position_mode")
	static function set_positionMode(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_skeleton2_dpath_constraint_rotate_mode")
	static function get_rotateMode(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_skeleton2_dpath_constraint_rotate_mode")
	static function set_rotateMode(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_skeleton2_dpath_constraint_spacing_mode")
	static function get_spacingMode(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_skeleton2_dpath_constraint_spacing_mode")
	static function set_spacingMode(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Skeleton2DPathConstraint(hl.Bytes) {
	public var mix(get, set):Single;

	inline function get_mix():Single return this.getF32(64);

	inline function set_mix(value:Single):Single { this.setF32(64, value); return value; }
	public var mixRotate(get, set):Single;

	inline function get_mixRotate():Single return this.getF32(68);

	inline function set_mixRotate(value:Single):Single { this.setF32(68, value); return value; }
	public var mixX(get, set):Single;

	inline function get_mixX():Single return this.getF32(72);

	inline function set_mixX(value:Single):Single { this.setF32(72, value); return value; }
	public var mixY(get, set):Single;

	inline function get_mixY():Single return this.getF32(76);

	inline function set_mixY(value:Single):Single { this.setF32(76, value); return value; }
	public var position(get, set):Single;

	inline function get_position():Single return this.getF32(80);

	inline function set_position(value:Single):Single { this.setF32(80, value); return value; }
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
		Skeleton2DPathConstraint_Ffi.set_positionMode(this, bytes.getData().bytes, bytes.length);
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
		Skeleton2DPathConstraint_Ffi.set_rotateMode(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var spacing(get, set):Single;

	inline function get_spacing():Single return this.getF32(136);

	inline function set_spacing(value:Single):Single { this.setF32(136, value); return value; }
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
		Skeleton2DPathConstraint_Ffi.set_spacingMode(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var targetSlotIndex(get, set):Int;

	inline function get_targetSlotIndex():Int return this.getI32(168);

	inline function set_targetSlotIndex(value:Int):Int { this.setI32(168, value); return value; }
}

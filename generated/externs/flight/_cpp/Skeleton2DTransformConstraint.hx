package flight._cpp;

private extern class Skeleton2DTransformConstraint_Ffi {
	@:native("flight_get_skeleton2_dtransform_constraint_mix") static function get_mix(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dtransform_constraint_mix") static function set_mix(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dtransform_constraint_mix_rotate") static function get_mixRotate(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dtransform_constraint_mix_rotate") static function set_mixRotate(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dtransform_constraint_mix_scale_x") static function get_mixScaleX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dtransform_constraint_mix_scale_x") static function set_mixScaleX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dtransform_constraint_mix_scale_y") static function get_mixScaleY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dtransform_constraint_mix_scale_y") static function set_mixScaleY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dtransform_constraint_mix_shear_y") static function get_mixShearY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dtransform_constraint_mix_shear_y") static function set_mixShearY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dtransform_constraint_mix_x") static function get_mixX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dtransform_constraint_mix_x") static function set_mixX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dtransform_constraint_mix_y") static function get_mixY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dtransform_constraint_mix_y") static function set_mixY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dtransform_constraint_offset_rotation") static function get_offsetRotation(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dtransform_constraint_offset_rotation") static function set_offsetRotation(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dtransform_constraint_offset_scale_x") static function get_offsetScaleX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dtransform_constraint_offset_scale_x") static function set_offsetScaleX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dtransform_constraint_offset_scale_y") static function get_offsetScaleY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dtransform_constraint_offset_scale_y") static function set_offsetScaleY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dtransform_constraint_offset_shear_y") static function get_offsetShearY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dtransform_constraint_offset_shear_y") static function set_offsetShearY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dtransform_constraint_offset_x") static function get_offsetX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dtransform_constraint_offset_x") static function set_offsetX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dtransform_constraint_offset_y") static function get_offsetY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skeleton2_dtransform_constraint_offset_y") static function set_offsetY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skeleton2_dtransform_constraint_target_bone_index") static function get_targetBoneIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_skeleton2_dtransform_constraint_target_bone_index") static function set_targetBoneIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Skeleton2DTransformConstraint(cpp.Star<cpp.Void>) {
	public var mix(get, set):Single;

	inline function get_mix():Single return Skeleton2DTransformConstraint_Ffi.get_mix(this);

	inline function set_mix(value:Single):Single return Skeleton2DTransformConstraint_Ffi.set_mix(this, value);
	public var mixRotate(get, set):Single;

	inline function get_mixRotate():Single return Skeleton2DTransformConstraint_Ffi.get_mixRotate(this);

	inline function set_mixRotate(value:Single):Single return Skeleton2DTransformConstraint_Ffi.set_mixRotate(this, value);
	public var mixScaleX(get, set):Single;

	inline function get_mixScaleX():Single return Skeleton2DTransformConstraint_Ffi.get_mixScaleX(this);

	inline function set_mixScaleX(value:Single):Single return Skeleton2DTransformConstraint_Ffi.set_mixScaleX(this, value);
	public var mixScaleY(get, set):Single;

	inline function get_mixScaleY():Single return Skeleton2DTransformConstraint_Ffi.get_mixScaleY(this);

	inline function set_mixScaleY(value:Single):Single return Skeleton2DTransformConstraint_Ffi.set_mixScaleY(this, value);
	public var mixShearY(get, set):Single;

	inline function get_mixShearY():Single return Skeleton2DTransformConstraint_Ffi.get_mixShearY(this);

	inline function set_mixShearY(value:Single):Single return Skeleton2DTransformConstraint_Ffi.set_mixShearY(this, value);
	public var mixX(get, set):Single;

	inline function get_mixX():Single return Skeleton2DTransformConstraint_Ffi.get_mixX(this);

	inline function set_mixX(value:Single):Single return Skeleton2DTransformConstraint_Ffi.set_mixX(this, value);
	public var mixY(get, set):Single;

	inline function get_mixY():Single return Skeleton2DTransformConstraint_Ffi.get_mixY(this);

	inline function set_mixY(value:Single):Single return Skeleton2DTransformConstraint_Ffi.set_mixY(this, value);
	public var offsetRotation(get, set):Single;

	inline function get_offsetRotation():Single return Skeleton2DTransformConstraint_Ffi.get_offsetRotation(this);

	inline function set_offsetRotation(value:Single):Single return Skeleton2DTransformConstraint_Ffi.set_offsetRotation(this, value);
	public var offsetScaleX(get, set):Single;

	inline function get_offsetScaleX():Single return Skeleton2DTransformConstraint_Ffi.get_offsetScaleX(this);

	inline function set_offsetScaleX(value:Single):Single return Skeleton2DTransformConstraint_Ffi.set_offsetScaleX(this, value);
	public var offsetScaleY(get, set):Single;

	inline function get_offsetScaleY():Single return Skeleton2DTransformConstraint_Ffi.get_offsetScaleY(this);

	inline function set_offsetScaleY(value:Single):Single return Skeleton2DTransformConstraint_Ffi.set_offsetScaleY(this, value);
	public var offsetShearY(get, set):Single;

	inline function get_offsetShearY():Single return Skeleton2DTransformConstraint_Ffi.get_offsetShearY(this);

	inline function set_offsetShearY(value:Single):Single return Skeleton2DTransformConstraint_Ffi.set_offsetShearY(this, value);
	public var offsetX(get, set):Single;

	inline function get_offsetX():Single return Skeleton2DTransformConstraint_Ffi.get_offsetX(this);

	inline function set_offsetX(value:Single):Single return Skeleton2DTransformConstraint_Ffi.set_offsetX(this, value);
	public var offsetY(get, set):Single;

	inline function get_offsetY():Single return Skeleton2DTransformConstraint_Ffi.get_offsetY(this);

	inline function set_offsetY(value:Single):Single return Skeleton2DTransformConstraint_Ffi.set_offsetY(this, value);
	public var targetBoneIndex(get, set):Int;

	inline function get_targetBoneIndex():Int return Skeleton2DTransformConstraint_Ffi.get_targetBoneIndex(this);

	inline function set_targetBoneIndex(value:Int):Int return Skeleton2DTransformConstraint_Ffi.set_targetBoneIndex(this, value);
}

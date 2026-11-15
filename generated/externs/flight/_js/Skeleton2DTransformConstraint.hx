package flight._js;

@:jsRequire("flight")
private extern class Skeleton2DTransformConstraint_Ffi {
	@:native("flight_get_skeleton2_dtransform_constraint_mix") static function get_mix(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dtransform_constraint_mix") static function set_mix(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dtransform_constraint_mix_rotate") static function get_mixRotate(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dtransform_constraint_mix_rotate") static function set_mixRotate(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dtransform_constraint_mix_scale_x") static function get_mixScaleX(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dtransform_constraint_mix_scale_x") static function set_mixScaleX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dtransform_constraint_mix_scale_y") static function get_mixScaleY(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dtransform_constraint_mix_scale_y") static function set_mixScaleY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dtransform_constraint_mix_shear_y") static function get_mixShearY(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dtransform_constraint_mix_shear_y") static function set_mixShearY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dtransform_constraint_mix_x") static function get_mixX(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dtransform_constraint_mix_x") static function set_mixX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dtransform_constraint_mix_y") static function get_mixY(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dtransform_constraint_mix_y") static function set_mixY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dtransform_constraint_offset_rotation") static function get_offsetRotation(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dtransform_constraint_offset_rotation") static function set_offsetRotation(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dtransform_constraint_offset_scale_x") static function get_offsetScaleX(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dtransform_constraint_offset_scale_x") static function set_offsetScaleX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dtransform_constraint_offset_scale_y") static function get_offsetScaleY(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dtransform_constraint_offset_scale_y") static function set_offsetScaleY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dtransform_constraint_offset_shear_y") static function get_offsetShearY(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dtransform_constraint_offset_shear_y") static function set_offsetShearY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dtransform_constraint_offset_x") static function get_offsetX(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dtransform_constraint_offset_x") static function set_offsetX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dtransform_constraint_offset_y") static function get_offsetY(ptr:Dynamic):Float;
	@:native("flight_set_skeleton2_dtransform_constraint_offset_y") static function set_offsetY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_skeleton2_dtransform_constraint_target_bone_index") static function get_targetBoneIndex(ptr:Dynamic):Int;
	@:native("flight_set_skeleton2_dtransform_constraint_target_bone_index") static function set_targetBoneIndex(ptr:Dynamic, value:Int):Int;
}

abstract Skeleton2DTransformConstraint(Dynamic) {
	public var mix(get, set):Float;

	inline function get_mix():Float return Skeleton2DTransformConstraint_Ffi.get_mix(this);

	inline function set_mix(value:Float):Float return Skeleton2DTransformConstraint_Ffi.set_mix(this, value);
	public var mixRotate(get, set):Float;

	inline function get_mixRotate():Float return Skeleton2DTransformConstraint_Ffi.get_mixRotate(this);

	inline function set_mixRotate(value:Float):Float return Skeleton2DTransformConstraint_Ffi.set_mixRotate(this, value);
	public var mixScaleX(get, set):Float;

	inline function get_mixScaleX():Float return Skeleton2DTransformConstraint_Ffi.get_mixScaleX(this);

	inline function set_mixScaleX(value:Float):Float return Skeleton2DTransformConstraint_Ffi.set_mixScaleX(this, value);
	public var mixScaleY(get, set):Float;

	inline function get_mixScaleY():Float return Skeleton2DTransformConstraint_Ffi.get_mixScaleY(this);

	inline function set_mixScaleY(value:Float):Float return Skeleton2DTransformConstraint_Ffi.set_mixScaleY(this, value);
	public var mixShearY(get, set):Float;

	inline function get_mixShearY():Float return Skeleton2DTransformConstraint_Ffi.get_mixShearY(this);

	inline function set_mixShearY(value:Float):Float return Skeleton2DTransformConstraint_Ffi.set_mixShearY(this, value);
	public var mixX(get, set):Float;

	inline function get_mixX():Float return Skeleton2DTransformConstraint_Ffi.get_mixX(this);

	inline function set_mixX(value:Float):Float return Skeleton2DTransformConstraint_Ffi.set_mixX(this, value);
	public var mixY(get, set):Float;

	inline function get_mixY():Float return Skeleton2DTransformConstraint_Ffi.get_mixY(this);

	inline function set_mixY(value:Float):Float return Skeleton2DTransformConstraint_Ffi.set_mixY(this, value);
	public var offsetRotation(get, set):Float;

	inline function get_offsetRotation():Float return Skeleton2DTransformConstraint_Ffi.get_offsetRotation(this);

	inline function set_offsetRotation(value:Float):Float return Skeleton2DTransformConstraint_Ffi.set_offsetRotation(this, value);
	public var offsetScaleX(get, set):Float;

	inline function get_offsetScaleX():Float return Skeleton2DTransformConstraint_Ffi.get_offsetScaleX(this);

	inline function set_offsetScaleX(value:Float):Float return Skeleton2DTransformConstraint_Ffi.set_offsetScaleX(this, value);
	public var offsetScaleY(get, set):Float;

	inline function get_offsetScaleY():Float return Skeleton2DTransformConstraint_Ffi.get_offsetScaleY(this);

	inline function set_offsetScaleY(value:Float):Float return Skeleton2DTransformConstraint_Ffi.set_offsetScaleY(this, value);
	public var offsetShearY(get, set):Float;

	inline function get_offsetShearY():Float return Skeleton2DTransformConstraint_Ffi.get_offsetShearY(this);

	inline function set_offsetShearY(value:Float):Float return Skeleton2DTransformConstraint_Ffi.set_offsetShearY(this, value);
	public var offsetX(get, set):Float;

	inline function get_offsetX():Float return Skeleton2DTransformConstraint_Ffi.get_offsetX(this);

	inline function set_offsetX(value:Float):Float return Skeleton2DTransformConstraint_Ffi.set_offsetX(this, value);
	public var offsetY(get, set):Float;

	inline function get_offsetY():Float return Skeleton2DTransformConstraint_Ffi.get_offsetY(this);

	inline function set_offsetY(value:Float):Float return Skeleton2DTransformConstraint_Ffi.set_offsetY(this, value);
	public var targetBoneIndex(get, set):Int;

	inline function get_targetBoneIndex():Int return Skeleton2DTransformConstraint_Ffi.get_targetBoneIndex(this);

	inline function set_targetBoneIndex(value:Int):Int return Skeleton2DTransformConstraint_Ffi.set_targetBoneIndex(this, value);
}

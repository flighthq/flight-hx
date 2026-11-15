package flight._hl;

abstract Skeleton2DTransformConstraint(hl.Bytes) {
	public var mix(get, set):Single;

	inline function get_mix():Single return this.getF32(64);

	inline function set_mix(value:Single):Single { this.setF32(64, value); return value; }
	public var mixRotate(get, set):Single;

	inline function get_mixRotate():Single return this.getF32(68);

	inline function set_mixRotate(value:Single):Single { this.setF32(68, value); return value; }
	public var mixScaleX(get, set):Single;

	inline function get_mixScaleX():Single return this.getF32(72);

	inline function set_mixScaleX(value:Single):Single { this.setF32(72, value); return value; }
	public var mixScaleY(get, set):Single;

	inline function get_mixScaleY():Single return this.getF32(76);

	inline function set_mixScaleY(value:Single):Single { this.setF32(76, value); return value; }
	public var mixShearY(get, set):Single;

	inline function get_mixShearY():Single return this.getF32(80);

	inline function set_mixShearY(value:Single):Single { this.setF32(80, value); return value; }
	public var mixX(get, set):Single;

	inline function get_mixX():Single return this.getF32(84);

	inline function set_mixX(value:Single):Single { this.setF32(84, value); return value; }
	public var mixY(get, set):Single;

	inline function get_mixY():Single return this.getF32(88);

	inline function set_mixY(value:Single):Single { this.setF32(88, value); return value; }
	public var offsetRotation(get, set):Single;

	inline function get_offsetRotation():Single return this.getF32(92);

	inline function set_offsetRotation(value:Single):Single { this.setF32(92, value); return value; }
	public var offsetScaleX(get, set):Single;

	inline function get_offsetScaleX():Single return this.getF32(96);

	inline function set_offsetScaleX(value:Single):Single { this.setF32(96, value); return value; }
	public var offsetScaleY(get, set):Single;

	inline function get_offsetScaleY():Single return this.getF32(100);

	inline function set_offsetScaleY(value:Single):Single { this.setF32(100, value); return value; }
	public var offsetShearY(get, set):Single;

	inline function get_offsetShearY():Single return this.getF32(104);

	inline function set_offsetShearY(value:Single):Single { this.setF32(104, value); return value; }
	public var offsetX(get, set):Single;

	inline function get_offsetX():Single return this.getF32(108);

	inline function set_offsetX(value:Single):Single { this.setF32(108, value); return value; }
	public var offsetY(get, set):Single;

	inline function get_offsetY():Single return this.getF32(112);

	inline function set_offsetY(value:Single):Single { this.setF32(112, value); return value; }
	public var targetBoneIndex(get, set):Int;

	inline function get_targetBoneIndex():Int return this.getI32(116);

	inline function set_targetBoneIndex(value:Int):Int { this.setI32(116, value); return value; }
}

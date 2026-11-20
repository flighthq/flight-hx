package flight._hl;

abstract Skeleton2DTransformConstraint(hl.Bytes) {
	public var mix(get, set):Float;

	inline function get_mix():Float return this.getF64(64);

	inline function set_mix(value:Float):Float { this.setF64(64, value); return value; }
	public var mixRotate(get, set):Float;

	inline function get_mixRotate():Float return this.getF64(72);

	inline function set_mixRotate(value:Float):Float { this.setF64(72, value); return value; }
	public var mixScaleX(get, set):Float;

	inline function get_mixScaleX():Float return this.getF64(80);

	inline function set_mixScaleX(value:Float):Float { this.setF64(80, value); return value; }
	public var mixScaleY(get, set):Float;

	inline function get_mixScaleY():Float return this.getF64(88);

	inline function set_mixScaleY(value:Float):Float { this.setF64(88, value); return value; }
	public var mixShearY(get, set):Float;

	inline function get_mixShearY():Float return this.getF64(96);

	inline function set_mixShearY(value:Float):Float { this.setF64(96, value); return value; }
	public var mixX(get, set):Float;

	inline function get_mixX():Float return this.getF64(104);

	inline function set_mixX(value:Float):Float { this.setF64(104, value); return value; }
	public var mixY(get, set):Float;

	inline function get_mixY():Float return this.getF64(112);

	inline function set_mixY(value:Float):Float { this.setF64(112, value); return value; }
	public var offsetRotation(get, set):Float;

	inline function get_offsetRotation():Float return this.getF64(120);

	inline function set_offsetRotation(value:Float):Float { this.setF64(120, value); return value; }
	public var offsetScaleX(get, set):Float;

	inline function get_offsetScaleX():Float return this.getF64(128);

	inline function set_offsetScaleX(value:Float):Float { this.setF64(128, value); return value; }
	public var offsetScaleY(get, set):Float;

	inline function get_offsetScaleY():Float return this.getF64(136);

	inline function set_offsetScaleY(value:Float):Float { this.setF64(136, value); return value; }
	public var offsetShearY(get, set):Float;

	inline function get_offsetShearY():Float return this.getF64(144);

	inline function set_offsetShearY(value:Float):Float { this.setF64(144, value); return value; }
	public var offsetX(get, set):Float;

	inline function get_offsetX():Float return this.getF64(152);

	inline function set_offsetX(value:Float):Float { this.setF64(152, value); return value; }
	public var offsetY(get, set):Float;

	inline function get_offsetY():Float return this.getF64(160);

	inline function set_offsetY(value:Float):Float { this.setF64(160, value); return value; }
	public var targetBoneIndex(get, set):Int;

	inline function get_targetBoneIndex():Int return this.getI32(168);

	inline function set_targetBoneIndex(value:Int):Int { this.setI32(168, value); return value; }
}

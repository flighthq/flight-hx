package flight._hl;

abstract ColladaLightDefinition(hl.Bytes) {
	public var color(get, set):Int;

	inline function get_color():Int return this.getI32(28);

	inline function set_color(value:Int):Int { this.setI32(28, value); return value; }
	public var decay(get, set):Single;

	inline function get_decay():Single return this.getF32(32);

	inline function set_decay(value:Single):Single { this.setF32(32, value); return value; }
	public var innerConeDegrees(get, set):Single;

	inline function get_innerConeDegrees():Single return this.getF32(36);

	inline function set_innerConeDegrees(value:Single):Single { this.setF32(36, value); return value; }
	public var intensity(get, set):Single;

	inline function get_intensity():Single return this.getF32(40);

	inline function set_intensity(value:Single):Single { this.setF32(40, value); return value; }
	public var outerConeDegrees(get, set):Single;

	inline function get_outerConeDegrees():Single return this.getF32(44);

	inline function set_outerConeDegrees(value:Single):Single { this.setF32(44, value); return value; }
	public var spotBlend(get, set):Single;

	inline function get_spotBlend():Single return this.getF32(48);

	inline function set_spotBlend(value:Single):Single { this.setF32(48, value); return value; }
}

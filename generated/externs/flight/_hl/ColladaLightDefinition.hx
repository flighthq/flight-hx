package flight._hl;

abstract ColladaLightDefinition(hl.Bytes) {
	public var color(get, set):Int;

	inline function get_color():Int return this.getI32(68);

	inline function set_color(value:Int):Int { this.setI32(68, value); return value; }
	public var decay(get, set):Float;

	inline function get_decay():Float return this.getF64(24);

	inline function set_decay(value:Float):Float { this.setF64(24, value); return value; }
	public var innerConeDegrees(get, set):Float;

	inline function get_innerConeDegrees():Float return this.getF64(32);

	inline function set_innerConeDegrees(value:Float):Float { this.setF64(32, value); return value; }
	public var intensity(get, set):Float;

	inline function get_intensity():Float return this.getF64(40);

	inline function set_intensity(value:Float):Float { this.setF64(40, value); return value; }
	public var outerConeDegrees(get, set):Float;

	inline function get_outerConeDegrees():Float return this.getF64(48);

	inline function set_outerConeDegrees(value:Float):Float { this.setF64(48, value); return value; }
	public var spotBlend(get, set):Float;

	inline function get_spotBlend():Float return this.getF64(56);

	inline function set_spotBlend(value:Float):Float { this.setF64(56, value); return value; }
}

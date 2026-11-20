package flight._hl;

abstract SvgColor(hl.Bytes) {
	public var alpha(get, set):Float;

	inline function get_alpha():Float return this.getF64(0);

	inline function set_alpha(value:Float):Float { this.setF64(0, value); return value; }
	public var rgb(get, set):Int;

	inline function get_rgb():Int return this.getI32(8);

	inline function set_rgb(value:Int):Int { this.setI32(8, value); return value; }
}

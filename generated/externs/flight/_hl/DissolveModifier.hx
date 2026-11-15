package flight._hl;

abstract DissolveModifier(hl.Bytes) {
	public var threshold(get, set):Single;

	inline function get_threshold():Single return this.getF32(64);

	inline function set_threshold(value:Single):Single { this.setF32(64, value); return value; }
	public var edgeColor(get, set):Int;

	inline function get_edgeColor():Int return this.getI32(68);

	inline function set_edgeColor(value:Int):Int { this.setI32(68, value); return value; }
	public var edgeWidth(get, set):Single;

	inline function get_edgeWidth():Single return this.getF32(72);

	inline function set_edgeWidth(value:Single):Single { this.setF32(72, value); return value; }
	public var scale(get, set):Single;

	inline function get_scale():Single return this.getF32(88);

	inline function set_scale(value:Single):Single { this.setF32(88, value); return value; }
}

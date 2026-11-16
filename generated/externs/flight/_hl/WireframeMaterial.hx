package flight._hl;

abstract WireframeMaterial(hl.Bytes) {
	public var color(get, set):Int;

	inline function get_color():Int return this.getI32(104);

	inline function set_color(value:Int):Int { this.setI32(104, value); return value; }
	public var thickness(get, set):Single;

	inline function get_thickness():Single return this.getF32(108);

	inline function set_thickness(value:Single):Single { this.setF32(108, value); return value; }
}

package flight._hl;

abstract FontVariationAxis(hl.Bytes) {
	public var defaultValue(get, set):Single;

	inline function get_defaultValue():Single return this.getF32(0);

	inline function set_defaultValue(value:Single):Single { this.setF32(0, value); return value; }
	public var max(get, set):Single;

	inline function get_max():Single return this.getF32(4);

	inline function set_max(value:Single):Single { this.setF32(4, value); return value; }
	public var min(get, set):Single;

	inline function get_min():Single return this.getF32(8);

	inline function set_min(value:Single):Single { this.setF32(8, value); return value; }
}

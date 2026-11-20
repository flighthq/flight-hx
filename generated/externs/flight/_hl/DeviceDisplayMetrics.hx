package flight._hl;

abstract DeviceDisplayMetrics(hl.Bytes) {
	public var colorDepth(get, set):Int;

	inline function get_colorDepth():Int return this.getI32(0);

	inline function set_colorDepth(value:Int):Int { this.setI32(0, value); return value; }
	public var densityDpi(get, set):Single;

	inline function get_densityDpi():Single return this.getF32(4);

	inline function set_densityDpi(value:Single):Single { this.setF32(4, value); return value; }
	public var logicalHeight(get, set):Single;

	inline function get_logicalHeight():Single return this.getF32(8);

	inline function set_logicalHeight(value:Single):Single { this.setF32(8, value); return value; }
	public var logicalWidth(get, set):Single;

	inline function get_logicalWidth():Single return this.getF32(12);

	inline function set_logicalWidth(value:Single):Single { this.setF32(12, value); return value; }
	public var physicalHeight(get, set):Single;

	inline function get_physicalHeight():Single return this.getF32(16);

	inline function set_physicalHeight(value:Single):Single { this.setF32(16, value); return value; }
	public var physicalWidth(get, set):Single;

	inline function get_physicalWidth():Single return this.getF32(20);

	inline function set_physicalWidth(value:Single):Single { this.setF32(20, value); return value; }
	public var pixelRatio(get, set):Single;

	inline function get_pixelRatio():Single return this.getF32(24);

	inline function set_pixelRatio(value:Single):Single { this.setF32(24, value); return value; }
}

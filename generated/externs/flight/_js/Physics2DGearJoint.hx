package flight._js;

abstract Physics2DGearJoint(Dynamic) {
	public var axisAx(get, set):Float;
	inline function get_axisAx():Float return untyped this.axisAx;
	inline function set_axisAx(value:Float):Float return untyped this.axisAx = value;
	public var axisAy(get, set):Float;
	inline function get_axisAy():Float return untyped this.axisAy;
	inline function set_axisAy(value:Float):Float return untyped this.axisAy = value;
	public var axisBx(get, set):Float;
	inline function get_axisBx():Float return untyped this.axisBx;
	inline function set_axisBx(value:Float):Float return untyped this.axisBx = value;
	public var axisBy(get, set):Float;
	inline function get_axisBy():Float return untyped this.axisBy;
	inline function set_axisBy(value:Float):Float return untyped this.axisBy = value;
	public var constant(get, set):Float;
	inline function get_constant():Float return untyped this.constant;
	inline function set_constant(value:Float):Float return untyped this.constant = value;
	public var ratio(get, set):Float;
	inline function get_ratio():Float return untyped this.ratio;
	inline function set_ratio(value:Float):Float return untyped this.ratio = value;
}

package flight._js;

abstract Physics2DPulleyJointOptions(Dynamic) {
	public var constant(get, set):Float;
	inline function get_constant():Float return untyped this.constant;
	inline function set_constant(value:Float):Float return untyped this.constant = value;
	public var groundAnchorAx(get, set):Float;
	inline function get_groundAnchorAx():Float return untyped this.groundAnchorAx;
	inline function set_groundAnchorAx(value:Float):Float return untyped this.groundAnchorAx = value;
	public var groundAnchorAy(get, set):Float;
	inline function get_groundAnchorAy():Float return untyped this.groundAnchorAy;
	inline function set_groundAnchorAy(value:Float):Float return untyped this.groundAnchorAy = value;
	public var groundAnchorBx(get, set):Float;
	inline function get_groundAnchorBx():Float return untyped this.groundAnchorBx;
	inline function set_groundAnchorBx(value:Float):Float return untyped this.groundAnchorBx = value;
	public var groundAnchorBy(get, set):Float;
	inline function get_groundAnchorBy():Float return untyped this.groundAnchorBy;
	inline function set_groundAnchorBy(value:Float):Float return untyped this.groundAnchorBy = value;
}

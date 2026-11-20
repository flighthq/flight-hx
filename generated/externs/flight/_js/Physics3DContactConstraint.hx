package flight._js;

abstract Physics3DContactConstraint(Dynamic) {
	public var contact(get, set):Int;
	inline function get_contact():Int return untyped this.contact;
	inline function set_contact(value:Int):Int return untyped this.contact = value;
	public var tangent0X(get, set):Float;
	inline function get_tangent0X():Float return untyped this.tangent0X;
	inline function set_tangent0X(value:Float):Float return untyped this.tangent0X = value;
	public var tangent0Y(get, set):Float;
	inline function get_tangent0Y():Float return untyped this.tangent0Y;
	inline function set_tangent0Y(value:Float):Float return untyped this.tangent0Y = value;
	public var tangent0Z(get, set):Float;
	inline function get_tangent0Z():Float return untyped this.tangent0Z;
	inline function set_tangent0Z(value:Float):Float return untyped this.tangent0Z = value;
	public var tangent1X(get, set):Float;
	inline function get_tangent1X():Float return untyped this.tangent1X;
	inline function set_tangent1X(value:Float):Float return untyped this.tangent1X = value;
	public var tangent1Y(get, set):Float;
	inline function get_tangent1Y():Float return untyped this.tangent1Y;
	inline function set_tangent1Y(value:Float):Float return untyped this.tangent1Y = value;
	public var tangent1Z(get, set):Float;
	inline function get_tangent1Z():Float return untyped this.tangent1Z;
	inline function set_tangent1Z(value:Float):Float return untyped this.tangent1Z = value;
	public var pointCount(get, set):Int;
	inline function get_pointCount():Int return untyped this.pointCount;
	inline function set_pointCount(value:Int):Int return untyped this.pointCount = value;
}

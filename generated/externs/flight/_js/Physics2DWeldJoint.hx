package flight._js;

abstract Physics2DWeldJoint(Dynamic) {
	public var referenceAngle(get, set):Float;
	inline function get_referenceAngle():Float return untyped this["referenceAngle"];
	inline function set_referenceAngle(value:Float):Float return untyped this["referenceAngle"] = value;
}

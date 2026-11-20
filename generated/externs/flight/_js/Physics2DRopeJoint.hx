package flight._js;

abstract Physics2DRopeJoint(Dynamic) {
	public var maxLength(get, set):Float;
	inline function get_maxLength():Float return untyped this.maxLength;
	inline function set_maxLength(value:Float):Float return untyped this.maxLength = value;
}

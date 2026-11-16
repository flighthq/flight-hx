package flight._js;

abstract HasTransform2DRuntime(Dynamic) {
	public var rotationAngle(get, set):Float;
	inline function get_rotationAngle():Float return untyped this.rotationAngle;
	inline function set_rotationAngle(value:Float):Float return untyped this.rotationAngle = value;
	public var rotationCosine(get, set):Float;
	inline function get_rotationCosine():Float return untyped this.rotationCosine;
	inline function set_rotationCosine(value:Float):Float return untyped this.rotationCosine = value;
	public var rotationSine(get, set):Float;
	inline function get_rotationSine():Float return untyped this.rotationSine;
	inline function set_rotationSine(value:Float):Float return untyped this.rotationSine = value;
}

package flight._js;

abstract ConvolutionEffect(Dynamic) {
	public var matrixX(get, set):Float;
	inline function get_matrixX():Float return untyped this.matrixX;
	inline function set_matrixX(value:Float):Float return untyped this.matrixX = value;
	public var matrixY(get, set):Float;
	inline function get_matrixY():Float return untyped this.matrixY;
	inline function set_matrixY(value:Float):Float return untyped this.matrixY = value;
}

package flight._js;

abstract HitTestResult(Dynamic) {
	public var localX(get, set):Float;
	inline function get_localX():Float return untyped this.localX;
	inline function set_localX(value:Float):Float return untyped this.localX = value;
	public var localY(get, set):Float;
	inline function get_localY():Float return untyped this.localY;
	inline function set_localY(value:Float):Float return untyped this.localY = value;
	public var subIndex(get, set):Int;
	inline function get_subIndex():Int return untyped this.subIndex;
	inline function set_subIndex(value:Int):Int return untyped this.subIndex = value;
}

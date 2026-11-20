package flight._js;

abstract DeviceDisplayMetrics(Dynamic) {
	public var colorDepth(get, set):Int;
	inline function get_colorDepth():Int return untyped this.colorDepth;
	inline function set_colorDepth(value:Int):Int return untyped this.colorDepth = value;
	public var densityDpi(get, set):Float;
	inline function get_densityDpi():Float return untyped this.densityDpi;
	inline function set_densityDpi(value:Float):Float return untyped this.densityDpi = value;
	public var logicalHeight(get, set):Float;
	inline function get_logicalHeight():Float return untyped this.logicalHeight;
	inline function set_logicalHeight(value:Float):Float return untyped this.logicalHeight = value;
	public var logicalWidth(get, set):Float;
	inline function get_logicalWidth():Float return untyped this.logicalWidth;
	inline function set_logicalWidth(value:Float):Float return untyped this.logicalWidth = value;
	public var physicalHeight(get, set):Float;
	inline function get_physicalHeight():Float return untyped this.physicalHeight;
	inline function set_physicalHeight(value:Float):Float return untyped this.physicalHeight = value;
	public var physicalWidth(get, set):Float;
	inline function get_physicalWidth():Float return untyped this.physicalWidth;
	inline function set_physicalWidth(value:Float):Float return untyped this.physicalWidth = value;
	public var pixelRatio(get, set):Float;
	inline function get_pixelRatio():Float return untyped this.pixelRatio;
	inline function set_pixelRatio(value:Float):Float return untyped this.pixelRatio = value;
}

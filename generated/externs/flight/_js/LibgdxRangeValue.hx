package flight._js;

abstract LibgdxRangeValue(Dynamic) {
	public var lowMin(get, set):Float;
	inline function get_lowMin():Float return untyped this.lowMin;
	inline function set_lowMin(value:Float):Float return untyped this.lowMin = value;
	public var lowMax(get, set):Float;
	inline function get_lowMax():Float return untyped this.lowMax;
	inline function set_lowMax(value:Float):Float return untyped this.lowMax = value;
	public var highMin(get, set):Float;
	inline function get_highMin():Float return untyped this.highMin;
	inline function set_highMin(value:Float):Float return untyped this.highMin = value;
	public var highMax(get, set):Float;
	inline function get_highMax():Float return untyped this.highMax;
	inline function set_highMax(value:Float):Float return untyped this.highMax = value;
	public var relative(get, set):Bool;
	inline function get_relative():Bool return untyped this.relative;
	inline function set_relative(value:Bool):Bool return untyped this.relative = value;
}

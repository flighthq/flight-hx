package flight._js;

abstract StatechartInput(Dynamic) {
	public var initialValue(get, set):Float;
	inline function get_initialValue():Float return untyped this.initialValue;
	inline function set_initialValue(value:Float):Float return untyped this.initialValue = value;
}

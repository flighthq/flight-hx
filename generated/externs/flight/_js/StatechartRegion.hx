package flight._js;

abstract StatechartRegion(Dynamic) {
	public var initialStateIndex(get, set):Int;
	inline function get_initialStateIndex():Int return untyped this.initialStateIndex;
	inline function set_initialStateIndex(value:Int):Int return untyped this.initialStateIndex = value;
}

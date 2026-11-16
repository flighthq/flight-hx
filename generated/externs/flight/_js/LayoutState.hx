package flight._js;

abstract LayoutState(Dynamic) {
	public var lastFailureActualLength(get, set):Int;
	inline function get_lastFailureActualLength():Int return untyped this.lastFailureActualLength;
	inline function set_lastFailureActualLength(value:Int):Int return untyped this.lastFailureActualLength = value;
	public var lastFailureNodeIndex(get, set):Int;
	inline function get_lastFailureNodeIndex():Int return untyped this.lastFailureNodeIndex;
	inline function set_lastFailureNodeIndex(value:Int):Int return untyped this.lastFailureNodeIndex = value;
	public var lastFailureParentIndex(get, set):Int;
	inline function get_lastFailureParentIndex():Int return untyped this.lastFailureParentIndex;
	inline function set_lastFailureParentIndex(value:Int):Int return untyped this.lastFailureParentIndex = value;
	public var lastFailureRequiredLength(get, set):Int;
	inline function get_lastFailureRequiredLength():Int return untyped this.lastFailureRequiredLength;
	inline function set_lastFailureRequiredLength(value:Int):Int return untyped this.lastFailureRequiredLength = value;
}

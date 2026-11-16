package flight._js;

abstract LayoutResolutionExplanation(Dynamic) {
	public var actualLength(get, set):Int;
	inline function get_actualLength():Int return untyped this.actualLength;
	inline function set_actualLength(value:Int):Int return untyped this.actualLength = value;
	public var nodeIndex(get, set):Int;
	inline function get_nodeIndex():Int return untyped this.nodeIndex;
	inline function set_nodeIndex(value:Int):Int return untyped this.nodeIndex = value;
	public var parentIndex(get, set):Int;
	inline function get_parentIndex():Int return untyped this.parentIndex;
	inline function set_parentIndex(value:Int):Int return untyped this.parentIndex = value;
	public var requiredLength(get, set):Int;
	inline function get_requiredLength():Int return untyped this.requiredLength;
	inline function set_requiredLength(value:Int):Int return untyped this.requiredLength = value;
}

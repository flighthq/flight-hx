package flight._js;

abstract LayoutNode(Dynamic) {
	public var parentIndex(get, set):Int;
	inline function get_parentIndex():Int return untyped this.parentIndex;
	inline function set_parentIndex(value:Int):Int return untyped this.parentIndex = value;
}

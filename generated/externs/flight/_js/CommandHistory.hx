package flight._js;

abstract CommandHistory(Dynamic) {
	public var index(get, set):Int;
	inline function get_index():Int return untyped this.index;
	inline function set_index(value:Int):Int return untyped this.index = value;
	public var maxSize(get, set):Int;
	inline function get_maxSize():Int return untyped this.maxSize;
	inline function set_maxSize(value:Int):Int return untyped this.maxSize = value;
	public var transactionDepth(get, set):Int;
	inline function get_transactionDepth():Int return untyped this.transactionDepth;
	inline function set_transactionDepth(value:Int):Int return untyped this.transactionDepth = value;
	public var transactionIndex(get, set):Int;
	inline function get_transactionIndex():Int return untyped this.transactionIndex;
	inline function set_transactionIndex(value:Int):Int return untyped this.transactionIndex = value;
}

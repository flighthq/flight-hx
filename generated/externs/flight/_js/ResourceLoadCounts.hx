package flight._js;

abstract ResourceLoadCounts(Dynamic) {
	public var settledItems(get, set):Int;
	inline function get_settledItems():Int return untyped this.settledItems;
	inline function set_settledItems(value:Int):Int return untyped this.settledItems = value;
	public var inFlightItems(get, set):Int;
	inline function get_inFlightItems():Int return untyped this.inFlightItems;
	inline function set_inFlightItems(value:Int):Int return untyped this.inFlightItems = value;
	public var queuedItems(get, set):Int;
	inline function get_queuedItems():Int return untyped this.queuedItems;
	inline function set_queuedItems(value:Int):Int return untyped this.queuedItems = value;
	public var totalItems(get, set):Int;
	inline function get_totalItems():Int return untyped this.totalItems;
	inline function set_totalItems(value:Int):Int return untyped this.totalItems = value;
}

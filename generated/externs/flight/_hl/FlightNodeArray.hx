package flight._hl;

private extern class FlightNodeArray_Ffi {
	@:hlNative("flight", "flight_node_array_create")
	static function create():flight._hl.FlightNodeArray;
	@:hlNative("flight", "flight_node_array_len")
	static function length(array:flight._hl.FlightNodeArray):Int;
	@:hlNative("flight", "flight_node_array_get")
	static function get(array:flight._hl.FlightNodeArray, index:Int):flight._hl.FlightNode;
	@:hlNative("flight", "flight_node_array_push")
	static function push(array:flight._hl.FlightNodeArray, node:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_node_array_clear")
	static function clear(array:flight._hl.FlightNodeArray):Void;
	@:hlNative("flight", "flight_free_node_array")
	static function free(array:flight._hl.FlightNodeArray):Void;
}

abstract FlightNodeArray(hl.Bytes) {
	public static inline function create():FlightNodeArray return FlightNodeArray_Ffi.create();
	public var length(get, never):Int;
	inline function get_length():Int return FlightNodeArray_Ffi.length(cast this);
	public inline function get(index:Int):Null<FlightNode> return FlightNodeArray_Ffi.get(cast this, index);
	public inline function push(node:FlightNode):Bool return FlightNodeArray_Ffi.push(cast this, node);
	public inline function clear():Void FlightNodeArray_Ffi.clear(cast this);
	public inline function free():Void FlightNodeArray_Ffi.free(cast this);
}

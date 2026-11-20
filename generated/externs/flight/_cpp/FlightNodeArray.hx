package flight._cpp;

@:unreflective
@:native("FlightNodeArray")
private extern class FlightNodeArrayNative {}

private extern class FlightNodeArray_Ffi {
	@:native("flight_node_array_create")
	static function create():flight._cpp.FlightNodeArray;
	@:native("flight_node_array_len")
	static function length(array:flight._cpp.FlightNodeArray):Int;
	@:native("flight_node_array_get")
	static function get(array:flight._cpp.FlightNodeArray, index:Int):flight._cpp.FlightNode;
	@:native("flight_node_array_push")
	static function push(array:flight._cpp.FlightNodeArray, node:flight._cpp.FlightNode):Bool;
	@:native("flight_node_array_clear")
	static function clear(array:flight._cpp.FlightNodeArray):Void;
	@:native("flight_free_node_array")
	static function free(array:flight._cpp.FlightNodeArray):Void;
}

abstract FlightNodeArray(cpp.Star<FlightNodeArrayNative>) {
	public static inline function create():FlightNodeArray return FlightNodeArray_Ffi.create();
	public var length(get, never):Int;
	inline function get_length():Int return FlightNodeArray_Ffi.length(cast this);
	public inline function get(index:Int):Null<FlightNode> return FlightNodeArray_Ffi.get(cast this, index);
	public inline function push(node:FlightNode):Bool return FlightNodeArray_Ffi.push(cast this, node);
	public inline function clear():Void FlightNodeArray_Ffi.clear(cast this);
	public inline function free():Void FlightNodeArray_Ffi.free(cast this);
}

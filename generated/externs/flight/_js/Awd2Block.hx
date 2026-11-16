package flight._js;

abstract Awd2Block(Dynamic) {
	public var blockId(get, set):Int;
	inline function get_blockId():Int return untyped this["blockId"];
	inline function set_blockId(value:Int):Int return untyped this["blockId"] = value;
	public var blockType(get, set):Int;
	inline function get_blockType():Int return untyped this["blockType"];
	inline function set_blockType(value:Int):Int return untyped this["blockType"] = value;
	public var dataEnd(get, set):Int;
	inline function get_dataEnd():Int return untyped this["dataEnd"];
	inline function set_dataEnd(value:Int):Int return untyped this["dataEnd"] = value;
	public var dataStart(get, set):Int;
	inline function get_dataStart():Int return untyped this["dataStart"];
	inline function set_dataStart(value:Int):Int return untyped this["dataStart"] = value;
	public var geometryWide(get, set):Bool;
	inline function get_geometryWide():Bool return untyped this["geometryWide"];
	inline function set_geometryWide(value:Bool):Bool return untyped this["geometryWide"] = value;
	public var matrixWide(get, set):Bool;
	inline function get_matrixWide():Bool return untyped this["matrixWide"];
	inline function set_matrixWide(value:Bool):Bool return untyped this["matrixWide"] = value;
}

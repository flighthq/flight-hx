package flight._js;

abstract Awd2ParsedMeshInstance(Dynamic) {
	public var geometryId(get, set):Int;
	inline function get_geometryId():Int return untyped this["geometryId"];
	inline function set_geometryId(value:Int):Int return untyped this["geometryId"] = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this["name"];
	inline function set_name(value:String):String return untyped this["name"] = value;
	public var parentId(get, set):Int;
	inline function get_parentId():Int return untyped this["parentId"];
	inline function set_parentId(value:Int):Int return untyped this["parentId"] = value;
}

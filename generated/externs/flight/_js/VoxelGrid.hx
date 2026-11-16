package flight._js;

abstract VoxelGrid(Dynamic) {
	public var depth(get, set):Int;
	inline function get_depth():Int return untyped this["depth"];
	inline function set_depth(value:Int):Int return untyped this["depth"] = value;
}

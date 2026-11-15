package flight._hl;

abstract VoxelGrid(hl.Bytes) {
	public var depth(get, set):Int;

	inline function get_depth():Int return this.getI32(80);

	inline function set_depth(value:Int):Int { this.setI32(80, value); return value; }
}

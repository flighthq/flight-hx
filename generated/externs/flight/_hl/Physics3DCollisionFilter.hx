package flight._hl;

abstract Physics3DCollisionFilter(hl.Bytes) {
	public var categoryBits(get, set):Int;

	inline function get_categoryBits():Int return this.getI32(0);

	inline function set_categoryBits(value:Int):Int { this.setI32(0, value); return value; }
	public var maskBits(get, set):Int;

	inline function get_maskBits():Int return this.getI32(4);

	inline function set_maskBits(value:Int):Int { this.setI32(4, value); return value; }
	public var groupIndex(get, set):Int;

	inline function get_groupIndex():Int return this.getI32(8);

	inline function set_groupIndex(value:Int):Int { this.setI32(8, value); return value; }
}

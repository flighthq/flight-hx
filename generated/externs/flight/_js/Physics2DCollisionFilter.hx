package flight._js;

abstract Physics2DCollisionFilter(Dynamic) {
	public var categoryBits(get, set):Int;
	inline function get_categoryBits():Int return untyped this.categoryBits;
	inline function set_categoryBits(value:Int):Int return untyped this.categoryBits = value;
	public var maskBits(get, set):Int;
	inline function get_maskBits():Int return untyped this.maskBits;
	inline function set_maskBits(value:Int):Int return untyped this.maskBits = value;
	public var groupIndex(get, set):Int;
	inline function get_groupIndex():Int return untyped this.groupIndex;
	inline function set_groupIndex(value:Int):Int return untyped this.groupIndex = value;
}

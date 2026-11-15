package flight._hl;

abstract Physics2DQueryFilter(hl.Bytes) {
	public var categoryBits(get, set):Int;

	inline function get_categoryBits():Int return this.getI32(0);

	inline function set_categoryBits(value:Int):Int { this.setI32(0, value); return value; }
	public var includeDynamic(get, set):Bool;

	inline function get_includeDynamic():Bool return this.getUI8(4) != 0;

	inline function set_includeDynamic(value:Bool):Bool { this.setUI8(4, value ? 1 : 0); return value; }
	public var includeKinematic(get, set):Bool;

	inline function get_includeKinematic():Bool return this.getUI8(5) != 0;

	inline function set_includeKinematic(value:Bool):Bool { this.setUI8(5, value ? 1 : 0); return value; }
	public var includeSensors(get, set):Bool;

	inline function get_includeSensors():Bool return this.getUI8(6) != 0;

	inline function set_includeSensors(value:Bool):Bool { this.setUI8(6, value ? 1 : 0); return value; }
	public var includeStatic(get, set):Bool;

	inline function get_includeStatic():Bool return this.getUI8(7) != 0;

	inline function set_includeStatic(value:Bool):Bool { this.setUI8(7, value ? 1 : 0); return value; }
	public var maskBits(get, set):Int;

	inline function get_maskBits():Int return this.getI32(8);

	inline function set_maskBits(value:Int):Int { this.setI32(8, value); return value; }
}

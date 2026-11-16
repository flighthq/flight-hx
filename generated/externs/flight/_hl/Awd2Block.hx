package flight._hl;

abstract Awd2Block(hl.Bytes) {
	public var blockId(get, set):Int;

	inline function get_blockId():Int return this.getI32(32);

	inline function set_blockId(value:Int):Int { this.setI32(32, value); return value; }
	public var blockType(get, set):Int;

	inline function get_blockType():Int return this.getUI8(36);

	inline function set_blockType(value:Int):Int { this.setUI8(36, value); return value; }
	public var dataEnd(get, set):Int;

	inline function get_dataEnd():Int return this.getI32(0);

	inline function set_dataEnd(value:Int):Int { this.setI32(0, value); return value; }
	public var dataStart(get, set):Int;

	inline function get_dataStart():Int return this.getI32(8);

	inline function set_dataStart(value:Int):Int { this.setI32(8, value); return value; }
	public var geometryWide(get, set):Bool;

	inline function get_geometryWide():Bool return this.getUI8(37) != 0;

	inline function set_geometryWide(value:Bool):Bool { this.setUI8(37, value ? 1 : 0); return value; }
	public var matrixWide(get, set):Bool;

	inline function get_matrixWide():Bool return this.getUI8(38) != 0;

	inline function set_matrixWide(value:Bool):Bool { this.setUI8(38, value ? 1 : 0); return value; }
}

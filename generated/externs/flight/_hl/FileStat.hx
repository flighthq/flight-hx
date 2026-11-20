package flight._hl;

abstract FileStat(hl.Bytes) {
	public var size(get, set):Int;

	inline function get_size():Int return this.getI32(0);

	inline function set_size(value:Int):Int { this.setI32(0, value); return value; }
	public var isDirectory(get, set):Bool;

	inline function get_isDirectory():Bool return this.getUI8(24) != 0;

	inline function set_isDirectory(value:Bool):Bool { this.setUI8(24, value ? 1 : 0); return value; }
	public var modifiedTime(get, set):Float;

	inline function get_modifiedTime():Float return this.getF64(8);

	inline function set_modifiedTime(value:Float):Float { this.setF64(8, value); return value; }
	public var createdTime(get, set):Float;

	inline function get_createdTime():Float return this.getF64(16);

	inline function set_createdTime(value:Float):Float { this.setF64(16, value); return value; }
	public var isSymlink(get, set):Bool;

	inline function get_isSymlink():Bool return this.getUI8(25) != 0;

	inline function set_isSymlink(value:Bool):Bool { this.setUI8(25, value ? 1 : 0); return value; }
}

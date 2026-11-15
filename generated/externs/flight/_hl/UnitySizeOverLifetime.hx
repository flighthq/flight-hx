package flight._hl;

abstract UnitySizeOverLifetime(hl.Bytes) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(24) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(24, value ? 1 : 0); return value; }
	public var sizeEnd(get, set):Single;

	inline function get_sizeEnd():Single return this.getF32(28);

	inline function set_sizeEnd(value:Single):Single { this.setF32(28, value); return value; }
	public var sizeStart(get, set):Single;

	inline function get_sizeStart():Single return this.getF32(32);

	inline function set_sizeStart(value:Single):Single { this.setF32(32, value); return value; }
}

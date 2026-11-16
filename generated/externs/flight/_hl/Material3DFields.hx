package flight._hl;

abstract Material3DFields(hl.Bytes) {
	public var alphaCutoff(get, set):Single;

	inline function get_alphaCutoff():Single return this.getF32(92);

	inline function set_alphaCutoff(value:Single):Single { this.setF32(92, value); return value; }
	public var doubleSided(get, set):Bool;

	inline function get_doubleSided():Bool return this.getUI8(96) != 0;

	inline function set_doubleSided(value:Bool):Bool { this.setUI8(96, value ? 1 : 0); return value; }
}

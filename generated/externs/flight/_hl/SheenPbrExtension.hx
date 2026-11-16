package flight._hl;

abstract SheenPbrExtension(hl.Bytes) {
	public var sheenColor(get, set):Int;

	inline function get_sheenColor():Int return this.getI32(56);

	inline function set_sheenColor(value:Int):Int { this.setI32(56, value); return value; }
	public var sheenRoughness(get, set):Single;

	inline function get_sheenRoughness():Single return this.getF32(64);

	inline function set_sheenRoughness(value:Single):Single { this.setF32(64, value); return value; }
}

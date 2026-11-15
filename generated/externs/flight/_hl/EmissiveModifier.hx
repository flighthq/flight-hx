package flight._hl;

abstract EmissiveModifier(hl.Bytes) {
	public var color(get, set):Int;

	inline function get_color():Int return this.getI32(64);

	inline function set_color(value:Int):Int { this.setI32(64, value); return value; }
	public var strength(get, set):Single;

	inline function get_strength():Single return this.getF32(68);

	inline function set_strength(value:Single):Single { this.setF32(68, value); return value; }
	public var facingSoftness(get, set):Single;

	inline function get_facingSoftness():Single return this.getF32(84);

	inline function set_facingSoftness(value:Single):Single { this.setF32(84, value); return value; }
}

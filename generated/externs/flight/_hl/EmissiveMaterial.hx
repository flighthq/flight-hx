package flight._hl;

abstract EmissiveMaterial(hl.Bytes) {
	public var emissive(get, set):Int;

	inline function get_emissive():Int return this.getI32(112);

	inline function set_emissive(value:Int):Int { this.setI32(112, value); return value; }
	public var emissiveStrength(get, set):Single;

	inline function get_emissiveStrength():Single return this.getF32(116);

	inline function set_emissiveStrength(value:Single):Single { this.setF32(116, value); return value; }
}

package flight._hl;

abstract SpecularGlossinessPbrMaterial(hl.Bytes) {
	public var diffuse(get, set):Int;

	inline function get_diffuse():Int return this.getI32(144);

	inline function set_diffuse(value:Int):Int { this.setI32(144, value); return value; }
	public var emissive(get, set):Int;

	inline function get_emissive():Int return this.getI32(148);

	inline function set_emissive(value:Int):Int { this.setI32(148, value); return value; }
	public var emissiveStrength(get, set):Single;

	inline function get_emissiveStrength():Single return this.getF32(152);

	inline function set_emissiveStrength(value:Single):Single { this.setF32(152, value); return value; }
	public var glossiness(get, set):Single;

	inline function get_glossiness():Single return this.getF32(156);

	inline function set_glossiness(value:Single):Single { this.setF32(156, value); return value; }
	public var normalScale(get, set):Single;

	inline function get_normalScale():Single return this.getF32(160);

	inline function set_normalScale(value:Single):Single { this.setF32(160, value); return value; }
	public var occlusionStrength(get, set):Single;

	inline function get_occlusionStrength():Single return this.getF32(164);

	inline function set_occlusionStrength(value:Single):Single { this.setF32(164, value); return value; }
	public var specular(get, set):Int;

	inline function get_specular():Int return this.getI32(168);

	inline function set_specular(value:Int):Int { this.setI32(168, value); return value; }
}

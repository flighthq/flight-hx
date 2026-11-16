package flight._hl;

abstract StandardPbrMaterial(hl.Bytes) {
	public var baseColor(get, set):Int;

	inline function get_baseColor():Int return this.getI32(152);

	inline function set_baseColor(value:Int):Int { this.setI32(152, value); return value; }
	public var emissive(get, set):Int;

	inline function get_emissive():Int return this.getI32(156);

	inline function set_emissive(value:Int):Int { this.setI32(156, value); return value; }
	public var emissiveStrength(get, set):Single;

	inline function get_emissiveStrength():Single return this.getF32(160);

	inline function set_emissiveStrength(value:Single):Single { this.setF32(160, value); return value; }
	public var metallic(get, set):Single;

	inline function get_metallic():Single return this.getF32(164);

	inline function set_metallic(value:Single):Single { this.setF32(164, value); return value; }
	public var normalScale(get, set):Single;

	inline function get_normalScale():Single return this.getF32(168);

	inline function set_normalScale(value:Single):Single { this.setF32(168, value); return value; }
	public var occlusionStrength(get, set):Single;

	inline function get_occlusionStrength():Single return this.getF32(172);

	inline function set_occlusionStrength(value:Single):Single { this.setF32(172, value); return value; }
	public var roughness(get, set):Single;

	inline function get_roughness():Single return this.getF32(176);

	inline function set_roughness(value:Single):Single { this.setF32(176, value); return value; }
}

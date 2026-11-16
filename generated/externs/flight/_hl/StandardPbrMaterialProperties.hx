package flight._hl;

abstract StandardPbrMaterialProperties(hl.Bytes) {
	public var baseColor(get, set):Int;

	inline function get_baseColor():Int return this.getI32(48);

	inline function set_baseColor(value:Int):Int { this.setI32(48, value); return value; }
	public var emissive(get, set):Int;

	inline function get_emissive():Int return this.getI32(52);

	inline function set_emissive(value:Int):Int { this.setI32(52, value); return value; }
	public var emissiveStrength(get, set):Single;

	inline function get_emissiveStrength():Single return this.getF32(56);

	inline function set_emissiveStrength(value:Single):Single { this.setF32(56, value); return value; }
	public var metallic(get, set):Single;

	inline function get_metallic():Single return this.getF32(60);

	inline function set_metallic(value:Single):Single { this.setF32(60, value); return value; }
	public var normalScale(get, set):Single;

	inline function get_normalScale():Single return this.getF32(64);

	inline function set_normalScale(value:Single):Single { this.setF32(64, value); return value; }
	public var occlusionStrength(get, set):Single;

	inline function get_occlusionStrength():Single return this.getF32(68);

	inline function set_occlusionStrength(value:Single):Single { this.setF32(68, value); return value; }
	public var roughness(get, set):Single;

	inline function get_roughness():Single return this.getF32(72);

	inline function set_roughness(value:Single):Single { this.setF32(72, value); return value; }
}

package flight._hl;

abstract EnvReflectModifier(hl.Bytes) {
	public var tint(get, set):Int;

	inline function get_tint():Int return this.getI32(64);

	inline function set_tint(value:Int):Int { this.setI32(64, value); return value; }
	public var intensity(get, set):Single;

	inline function get_intensity():Single return this.getF32(68);

	inline function set_intensity(value:Single):Single { this.setF32(68, value); return value; }
	public var fresnelBias(get, set):Single;

	inline function get_fresnelBias():Single return this.getF32(72);

	inline function set_fresnelBias(value:Single):Single { this.setF32(72, value); return value; }
	public var roughness(get, set):Single;

	inline function get_roughness():Single return this.getF32(76);

	inline function set_roughness(value:Single):Single { this.setF32(76, value); return value; }
}

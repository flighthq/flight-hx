package flight._hl;

abstract AnisotropyPbrExtension(hl.Bytes) {
	public var anisotropyRotation(get, set):Single;

	inline function get_anisotropyRotation():Single return this.getF32(52);

	inline function set_anisotropyRotation(value:Single):Single { this.setF32(52, value); return value; }
	public var anisotropyStrength(get, set):Single;

	inline function get_anisotropyStrength():Single return this.getF32(56);

	inline function set_anisotropyStrength(value:Single):Single { this.setF32(56, value); return value; }
}

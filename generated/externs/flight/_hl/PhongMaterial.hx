package flight._hl;

abstract PhongMaterial(hl.Bytes) {
	public var diffuse(get, set):Int;

	inline function get_diffuse():Int return this.getI32(128);

	inline function set_diffuse(value:Int):Int { this.setI32(128, value); return value; }
	public var normalScale(get, set):Single;

	inline function get_normalScale():Single return this.getF32(132);

	inline function set_normalScale(value:Single):Single { this.setF32(132, value); return value; }
	public var shininess(get, set):Single;

	inline function get_shininess():Single return this.getF32(136);

	inline function set_shininess(value:Single):Single { this.setF32(136, value); return value; }
	public var specular(get, set):Int;

	inline function get_specular():Int return this.getI32(140);

	inline function set_specular(value:Int):Int { this.setI32(140, value); return value; }
}

package flight._hl;

abstract BlinnPhongMaterial(hl.Bytes) {
	public var diffuse(get, set):Int;

	inline function get_diffuse():Int return this.getI32(136);

	inline function set_diffuse(value:Int):Int { this.setI32(136, value); return value; }
	public var normalScale(get, set):Single;

	inline function get_normalScale():Single return this.getF32(140);

	inline function set_normalScale(value:Single):Single { this.setF32(140, value); return value; }
	public var shininess(get, set):Single;

	inline function get_shininess():Single return this.getF32(144);

	inline function set_shininess(value:Single):Single { this.setF32(144, value); return value; }
	public var specular(get, set):Int;

	inline function get_specular():Int return this.getI32(148);

	inline function set_specular(value:Int):Int { this.setI32(148, value); return value; }
}

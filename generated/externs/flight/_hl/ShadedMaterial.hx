package flight._hl;

abstract ShadedMaterial(hl.Bytes) {
	public var diffuse(get, set):Int;

	inline function get_diffuse():Int return this.getI32(104);

	inline function set_diffuse(value:Int):Int { this.setI32(104, value); return value; }
	public var normalScale(get, set):Single;

	inline function get_normalScale():Single return this.getF32(152);

	inline function set_normalScale(value:Single):Single { this.setF32(152, value); return value; }
	public var shininess(get, set):Single;

	inline function get_shininess():Single return this.getF32(156);

	inline function set_shininess(value:Single):Single { this.setF32(156, value); return value; }
	public var specular(get, set):Int;

	inline function get_specular():Int return this.getI32(160);

	inline function set_specular(value:Int):Int { this.setI32(160, value); return value; }
}

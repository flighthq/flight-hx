package flight._hl;

abstract SpecularPbrExtension(hl.Bytes) {
	public var specular(get, set):Single;

	inline function get_specular():Single return this.getF32(56);

	inline function set_specular(value:Single):Single { this.setF32(56, value); return value; }
	public var specularColor(get, set):Int;

	inline function get_specularColor():Int return this.getI32(60);

	inline function set_specularColor(value:Int):Int { this.setI32(60, value); return value; }
}

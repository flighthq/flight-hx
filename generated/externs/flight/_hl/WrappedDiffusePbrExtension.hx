package flight._hl;

abstract WrappedDiffusePbrExtension(hl.Bytes) {
	public var thickness(get, set):Single;

	inline function get_thickness():Single return this.getF32(56);

	inline function set_thickness(value:Single):Single { this.setF32(56, value); return value; }
	public var wrappedDiffuseColor(get, set):Int;

	inline function get_wrappedDiffuseColor():Int return this.getI32(64);

	inline function set_wrappedDiffuseColor(value:Int):Int { this.setI32(64, value); return value; }
	public var wrappedDiffuseStrength(get, set):Single;

	inline function get_wrappedDiffuseStrength():Single return this.getF32(72);

	inline function set_wrappedDiffuseStrength(value:Single):Single { this.setF32(72, value); return value; }
}

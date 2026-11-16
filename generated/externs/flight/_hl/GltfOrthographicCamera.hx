package flight._hl;

abstract GltfOrthographicCamera(hl.Bytes) {
	public var xmag(get, set):Single;

	inline function get_xmag():Single return this.getF32(0);

	inline function set_xmag(value:Single):Single { this.setF32(0, value); return value; }
	public var ymag(get, set):Single;

	inline function get_ymag():Single return this.getF32(4);

	inline function set_ymag(value:Single):Single { this.setF32(4, value); return value; }
	public var zfar(get, set):Single;

	inline function get_zfar():Single return this.getF32(8);

	inline function set_zfar(value:Single):Single { this.setF32(8, value); return value; }
	public var znear(get, set):Single;

	inline function get_znear():Single return this.getF32(12);

	inline function set_znear(value:Single):Single { this.setF32(12, value); return value; }
}

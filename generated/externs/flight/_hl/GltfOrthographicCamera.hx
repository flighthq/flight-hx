package flight._hl;

abstract GltfOrthographicCamera(hl.Bytes) {
	public var xmag(get, set):Float;

	inline function get_xmag():Float return this.getF64(0);

	inline function set_xmag(value:Float):Float { this.setF64(0, value); return value; }
	public var ymag(get, set):Float;

	inline function get_ymag():Float return this.getF64(8);

	inline function set_ymag(value:Float):Float { this.setF64(8, value); return value; }
	public var zfar(get, set):Float;

	inline function get_zfar():Float return this.getF64(16);

	inline function set_zfar(value:Float):Float { this.setF64(16, value); return value; }
	public var znear(get, set):Float;

	inline function get_znear():Float return this.getF64(24);

	inline function set_znear(value:Float):Float { this.setF64(24, value); return value; }
}

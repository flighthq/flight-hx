package flight._hl;

abstract GltfPerspectiveCamera(hl.Bytes) {
	public var yfov(get, set):Float;

	inline function get_yfov():Float return this.getF64(32);

	inline function set_yfov(value:Float):Float { this.setF64(32, value); return value; }
	public var znear(get, set):Float;

	inline function get_znear():Float return this.getF64(40);

	inline function set_znear(value:Float):Float { this.setF64(40, value); return value; }
}

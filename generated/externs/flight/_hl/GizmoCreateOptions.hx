package flight._hl;

abstract GizmoCreateOptions(hl.Bytes) {
	public var viewportHeight(get, set):Float;

	inline function get_viewportHeight():Float return this.getF64(72);

	inline function set_viewportHeight(value:Float):Float { this.setF64(72, value); return value; }
	public var viewportWidth(get, set):Float;

	inline function get_viewportWidth():Float return this.getF64(80);

	inline function set_viewportWidth(value:Float):Float { this.setF64(80, value); return value; }
}

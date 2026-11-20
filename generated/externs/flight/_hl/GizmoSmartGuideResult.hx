package flight._hl;

abstract GizmoSmartGuideResult(hl.Bytes) {
	public var deltaX(get, set):Float;

	inline function get_deltaX():Float return this.getF64(32);

	inline function set_deltaX(value:Float):Float { this.setF64(32, value); return value; }
	public var deltaY(get, set):Float;

	inline function get_deltaY():Float return this.getF64(40);

	inline function set_deltaY(value:Float):Float { this.setF64(40, value); return value; }
}

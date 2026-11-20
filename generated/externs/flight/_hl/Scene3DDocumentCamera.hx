package flight._hl;

abstract Scene3DDocumentCamera(hl.Bytes) {
	public var far(get, set):Float;

	inline function get_far():Float return this.getF64(48);

	inline function set_far(value:Float):Float { this.setF64(48, value); return value; }
	public var near(get, set):Float;

	inline function get_near():Float return this.getF64(56);

	inline function set_near(value:Float):Float { this.setF64(56, value); return value; }
}

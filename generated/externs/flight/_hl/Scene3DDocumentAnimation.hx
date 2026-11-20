package flight._hl;

abstract Scene3DDocumentAnimation(hl.Bytes) {
	public var duration(get, set):Float;

	inline function get_duration():Float return this.getF64(48);

	inline function set_duration(value:Float):Float { this.setF64(48, value); return value; }
}

package flight._hl;

abstract CollisionTestExplanation3D(hl.Bytes) {
	public var overlapping(get, set):Bool;

	inline function get_overlapping():Bool return this.getUI8(4) != 0;

	inline function set_overlapping(value:Bool):Bool { this.setUI8(4, value ? 1 : 0); return value; }
}

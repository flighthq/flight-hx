package flight._hl;

abstract InteractionHitEligibility(hl.Bytes) {
	public var eligible(get, set):Bool;

	inline function get_eligible():Bool return this.getUI8(0) != 0;

	inline function set_eligible(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var hasEligibleInSubtree(get, set):Bool;

	inline function get_hasEligibleInSubtree():Bool return this.getUI8(1) != 0;

	inline function set_hasEligibleInSubtree(value:Bool):Bool { this.setUI8(1, value ? 1 : 0); return value; }
}

package flight._js;

abstract InteractionHitEligibility(Dynamic) {
	public var eligible(get, set):Bool;
	inline function get_eligible():Bool return untyped this.eligible;
	inline function set_eligible(value:Bool):Bool return untyped this.eligible = value;
	public var hasEligibleInSubtree(get, set):Bool;
	inline function get_hasEligibleInSubtree():Bool return untyped this.hasEligibleInSubtree;
	inline function set_hasEligibleInSubtree(value:Bool):Bool return untyped this.hasEligibleInSubtree = value;
}

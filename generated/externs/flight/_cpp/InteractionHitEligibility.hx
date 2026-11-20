package flight._cpp;

private extern class InteractionHitEligibility_Ffi {
	@:native("flight_get_interaction_hit_eligibility_eligible") static function get_eligible(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_interaction_hit_eligibility_eligible") static function set_eligible(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_interaction_hit_eligibility_has_eligible_in_subtree") static function get_hasEligibleInSubtree(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_interaction_hit_eligibility_has_eligible_in_subtree") static function set_hasEligibleInSubtree(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract InteractionHitEligibility(cpp.Star<cpp.Void>) {
	public var eligible(get, set):Bool;

	inline function get_eligible():Bool return InteractionHitEligibility_Ffi.get_eligible(this);

	inline function set_eligible(value:Bool):Bool { InteractionHitEligibility_Ffi.set_eligible(this, value); return value; }
	public var hasEligibleInSubtree(get, set):Bool;

	inline function get_hasEligibleInSubtree():Bool return InteractionHitEligibility_Ffi.get_hasEligibleInSubtree(this);

	inline function set_hasEligibleInSubtree(value:Bool):Bool { InteractionHitEligibility_Ffi.set_hasEligibleInSubtree(this, value); return value; }
}

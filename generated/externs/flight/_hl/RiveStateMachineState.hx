package flight._hl;

abstract RiveStateMachineState(hl.Bytes) {
	public var animationId(get, set):Single;

	inline function get_animationId():Single return this.getF32(0);

	inline function set_animationId(value:Single):Single { this.setF32(0, value); return value; }
}

package flight._hl;

abstract AnimationStateMachine(hl.Bytes) {
	public var currentStateIndex(get, set):Int;

	inline function get_currentStateIndex():Int return this.getI32(48);

	inline function set_currentStateIndex(value:Int):Int { this.setI32(48, value); return value; }
	public var transitionDuration(get, set):Single;

	inline function get_transitionDuration():Single return this.getF32(144);

	inline function set_transitionDuration(value:Single):Single { this.setF32(144, value); return value; }
	public var transitionElapsed(get, set):Single;

	inline function get_transitionElapsed():Single return this.getF32(148);

	inline function set_transitionElapsed(value:Single):Single { this.setF32(148, value); return value; }
	public var transitionWeight(get, set):Single;

	inline function get_transitionWeight():Single return this.getF32(184);

	inline function set_transitionWeight(value:Single):Single { this.setF32(184, value); return value; }
}

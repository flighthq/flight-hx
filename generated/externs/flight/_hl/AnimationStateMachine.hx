package flight._hl;

abstract AnimationStateMachine(hl.Bytes) {
	public var currentStateIndex(get, set):Int;

	inline function get_currentStateIndex():Int return this.getI32(48);

	inline function set_currentStateIndex(value:Int):Int { this.setI32(48, value); return value; }
	public var transitionDuration(get, set):Float;

	inline function get_transitionDuration():Float return this.getF64(144);

	inline function set_transitionDuration(value:Float):Float { this.setF64(144, value); return value; }
	public var transitionElapsed(get, set):Float;

	inline function get_transitionElapsed():Float return this.getF64(152);

	inline function set_transitionElapsed(value:Float):Float { this.setF64(152, value); return value; }
	public var transitionWeight(get, set):Single;

	inline function get_transitionWeight():Single return this.getF32(192);

	inline function set_transitionWeight(value:Single):Single { this.setF32(192, value); return value; }
}

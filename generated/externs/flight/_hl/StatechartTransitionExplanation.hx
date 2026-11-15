package flight._hl;

abstract StatechartTransitionExplanation(hl.Bytes) {
	public var blend(get, set):Single;

	inline function get_blend():Single return this.getF32(0);

	inline function set_blend(value:Single):Single { this.setF32(0, value); return value; }
	public var conditionIndex(get, set):Int;

	inline function get_conditionIndex():Int return this.getI32(4);

	inline function set_conditionIndex(value:Int):Int { this.setI32(4, value); return value; }
	public var regionIndex(get, set):Int;

	inline function get_regionIndex():Int return this.getI32(8);

	inline function set_regionIndex(value:Int):Int { this.setI32(8, value); return value; }
	public var sourceStateIndex(get, set):Int;

	inline function get_sourceStateIndex():Int return this.getI32(12);

	inline function set_sourceStateIndex(value:Int):Int { this.setI32(12, value); return value; }
	public var targetStateIndex(get, set):Int;

	inline function get_targetStateIndex():Int return this.getI32(20);

	inline function set_targetStateIndex(value:Int):Int { this.setI32(20, value); return value; }
	public var transitionIndex(get, set):Int;

	inline function get_transitionIndex():Int return this.getI32(24);

	inline function set_transitionIndex(value:Int):Int { this.setI32(24, value); return value; }
}

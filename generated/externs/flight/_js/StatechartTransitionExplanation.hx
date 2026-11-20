package flight._js;

abstract StatechartTransitionExplanation(Dynamic) {
	public var blend(get, set):Float;
	inline function get_blend():Float return untyped this.blend;
	inline function set_blend(value:Float):Float return untyped this.blend = value;
	public var conditionIndex(get, set):Int;
	inline function get_conditionIndex():Int return untyped this.conditionIndex;
	inline function set_conditionIndex(value:Int):Int return untyped this.conditionIndex = value;
	public var regionIndex(get, set):Int;
	inline function get_regionIndex():Int return untyped this.regionIndex;
	inline function set_regionIndex(value:Int):Int return untyped this.regionIndex = value;
	public var sourceStateIndex(get, set):Int;
	inline function get_sourceStateIndex():Int return untyped this.sourceStateIndex;
	inline function set_sourceStateIndex(value:Int):Int return untyped this.sourceStateIndex = value;
	public var targetStateIndex(get, set):Int;
	inline function get_targetStateIndex():Int return untyped this.targetStateIndex;
	inline function set_targetStateIndex(value:Int):Int return untyped this.targetStateIndex = value;
	public var transitionIndex(get, set):Int;
	inline function get_transitionIndex():Int return untyped this.transitionIndex;
	inline function set_transitionIndex(value:Int):Int return untyped this.transitionIndex = value;
}

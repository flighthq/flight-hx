package flight._js;

abstract Physics3DRotationalCcdEnvelope(Dynamic) {
	public var angularTravel(get, set):Float;
	inline function get_angularTravel():Float return untyped this.angularTravel;
	inline function set_angularTravel(value:Float):Float return untyped this.angularTravel = value;
	public var sampleCount(get, set):Int;
	inline function get_sampleCount():Int return untyped this.sampleCount;
	inline function set_sampleCount(value:Int):Int return untyped this.sampleCount = value;
	public var maxAngularIncrement(get, set):Float;
	inline function get_maxAngularIncrement():Float return untyped this.maxAngularIncrement;
	inline function set_maxAngularIncrement(value:Float):Float return untyped this.maxAngularIncrement = value;
	public var maxPointArcTravel(get, set):Float;
	inline function get_maxPointArcTravel():Float return untyped this.maxPointArcTravel;
	inline function set_maxPointArcTravel(value:Float):Float return untyped this.maxPointArcTravel = value;
	public var targetIncrementMet(get, set):Bool;
	inline function get_targetIncrementMet():Bool return untyped this.targetIncrementMet;
	inline function set_targetIncrementMet(value:Bool):Bool return untyped this.targetIncrementMet = value;
}

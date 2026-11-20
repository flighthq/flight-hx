package flight._js;

abstract AnimationSampleAccumulator(Dynamic) {
	public var components(get, set):Int;
	inline function get_components():Int return untyped this.components;
	inline function set_components(value:Int):Int return untyped this.components = value;
	public var quaternion(get, set):Bool;
	inline function get_quaternion():Bool return untyped this.quaternion;
	inline function set_quaternion(value:Bool):Bool return untyped this.quaternion = value;
	public var weight(get, set):Float;
	inline function get_weight():Float return untyped this.weight;
	inline function set_weight(value:Float):Float return untyped this.weight = value;
}

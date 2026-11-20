package flight._js;

abstract AnimationLayer(Dynamic) {
	public var additive(get, set):Bool;
	inline function get_additive():Bool return untyped this.additive;
	inline function set_additive(value:Bool):Bool return untyped this.additive = value;
	public var weight(get, set):Float;
	inline function get_weight():Float return untyped this.weight;
	inline function set_weight(value:Float):Float return untyped this.weight = value;
}

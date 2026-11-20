package flight._js;

abstract ColladaSkinInfluence(Dynamic) {
	public var joint(get, set):String;
	inline function get_joint():String return untyped this.joint;
	inline function set_joint(value:String):String return untyped this.joint = value;
	public var weight(get, set):Float;
	inline function get_weight():Float return untyped this.weight;
	inline function set_weight(value:Float):Float return untyped this.weight = value;
}

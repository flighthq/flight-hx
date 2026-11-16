package flight._js;

abstract SkinInfluence(Dynamic) {
	public var jointIndex(get, set):Float;
	inline function get_jointIndex():Float return untyped this["jointIndex"];
	inline function set_jointIndex(value:Float):Float return untyped this["jointIndex"] = value;
	public var weight(get, set):Float;
	inline function get_weight():Float return untyped this["weight"];
	inline function set_weight(value:Float):Float return untyped this["weight"] = value;
}

package flight._js;

abstract Camera3DViewExplanation(Dynamic) {
	public var determinant(get, set):Float;
	inline function get_determinant():Float return untyped this["determinant"];
	inline function set_determinant(value:Float):Float return untyped this["determinant"] = value;
	public var isOrthonormal(get, set):Bool;
	inline function get_isOrthonormal():Bool return untyped this["isOrthonormal"];
	inline function set_isOrthonormal(value:Bool):Bool return untyped this["isOrthonormal"] = value;
	public var isReflection(get, set):Bool;
	inline function get_isReflection():Bool return untyped this["isReflection"];
	inline function set_isReflection(value:Bool):Bool return untyped this["isReflection"] = value;
	public var scaleDeviation(get, set):Float;
	inline function get_scaleDeviation():Float return untyped this["scaleDeviation"];
	inline function set_scaleDeviation(value:Float):Float return untyped this["scaleDeviation"] = value;
	public var shearDeviation(get, set):Float;
	inline function get_shearDeviation():Float return untyped this["shearDeviation"];
	inline function set_shearDeviation(value:Float):Float return untyped this["shearDeviation"] = value;
}

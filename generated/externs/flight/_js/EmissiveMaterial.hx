package flight._js;

abstract EmissiveMaterial(Dynamic) {
	public var emissive(get, set):Int;
	inline function get_emissive():Int return untyped this["emissive"];
	inline function set_emissive(value:Int):Int return untyped this["emissive"] = value;
	public var emissiveStrength(get, set):Float;
	inline function get_emissiveStrength():Float return untyped this["emissiveStrength"];
	inline function set_emissiveStrength(value:Float):Float return untyped this["emissiveStrength"] = value;
}

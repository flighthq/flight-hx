package flight._js;

abstract AnisotropyPbrExtension(Dynamic) {
	public var anisotropyRotation(get, set):Float;
	inline function get_anisotropyRotation():Float return untyped this["anisotropyRotation"];
	inline function set_anisotropyRotation(value:Float):Float return untyped this["anisotropyRotation"] = value;
	public var anisotropyStrength(get, set):Float;
	inline function get_anisotropyStrength():Float return untyped this["anisotropyStrength"];
	inline function set_anisotropyStrength(value:Float):Float return untyped this["anisotropyStrength"] = value;
}

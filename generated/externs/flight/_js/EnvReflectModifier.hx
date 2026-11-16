package flight._js;

abstract EnvReflectModifier(Dynamic) {
	public var tint(get, set):Int;
	inline function get_tint():Int return untyped this["tint"];
	inline function set_tint(value:Int):Int return untyped this["tint"] = value;
	public var intensity(get, set):Float;
	inline function get_intensity():Float return untyped this["intensity"];
	inline function set_intensity(value:Float):Float return untyped this["intensity"] = value;
	public var fresnelBias(get, set):Float;
	inline function get_fresnelBias():Float return untyped this["fresnelBias"];
	inline function set_fresnelBias(value:Float):Float return untyped this["fresnelBias"] = value;
	public var roughness(get, set):Float;
	inline function get_roughness():Float return untyped this["roughness"];
	inline function set_roughness(value:Float):Float return untyped this["roughness"] = value;
}

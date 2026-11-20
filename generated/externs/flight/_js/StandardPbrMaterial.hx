package flight._js;

abstract StandardPbrMaterial(Dynamic) {
	public var baseColor(get, set):Int;
	inline function get_baseColor():Int return untyped this.baseColor;
	inline function set_baseColor(value:Int):Int return untyped this.baseColor = value;
	public var emissive(get, set):Int;
	inline function get_emissive():Int return untyped this.emissive;
	inline function set_emissive(value:Int):Int return untyped this.emissive = value;
	public var emissiveStrength(get, set):Float;
	inline function get_emissiveStrength():Float return untyped this.emissiveStrength;
	inline function set_emissiveStrength(value:Float):Float return untyped this.emissiveStrength = value;
	public var metallic(get, set):Float;
	inline function get_metallic():Float return untyped this.metallic;
	inline function set_metallic(value:Float):Float return untyped this.metallic = value;
	public var normalScale(get, set):Float;
	inline function get_normalScale():Float return untyped this.normalScale;
	inline function set_normalScale(value:Float):Float return untyped this.normalScale = value;
	public var occlusionStrength(get, set):Float;
	inline function get_occlusionStrength():Float return untyped this.occlusionStrength;
	inline function set_occlusionStrength(value:Float):Float return untyped this.occlusionStrength = value;
	public var roughness(get, set):Float;
	inline function get_roughness():Float return untyped this.roughness;
	inline function set_roughness(value:Float):Float return untyped this.roughness = value;
}

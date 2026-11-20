package flight._js;

abstract SpecularGlossinessPbrMaterial(Dynamic) {
	public var diffuse(get, set):Int;
	inline function get_diffuse():Int return untyped this.diffuse;
	inline function set_diffuse(value:Int):Int return untyped this.diffuse = value;
	public var emissive(get, set):Int;
	inline function get_emissive():Int return untyped this.emissive;
	inline function set_emissive(value:Int):Int return untyped this.emissive = value;
	public var emissiveStrength(get, set):Float;
	inline function get_emissiveStrength():Float return untyped this.emissiveStrength;
	inline function set_emissiveStrength(value:Float):Float return untyped this.emissiveStrength = value;
	public var glossiness(get, set):Float;
	inline function get_glossiness():Float return untyped this.glossiness;
	inline function set_glossiness(value:Float):Float return untyped this.glossiness = value;
	public var normalScale(get, set):Float;
	inline function get_normalScale():Float return untyped this.normalScale;
	inline function set_normalScale(value:Float):Float return untyped this.normalScale = value;
	public var occlusionStrength(get, set):Float;
	inline function get_occlusionStrength():Float return untyped this.occlusionStrength;
	inline function set_occlusionStrength(value:Float):Float return untyped this.occlusionStrength = value;
	public var specular(get, set):Int;
	inline function get_specular():Int return untyped this.specular;
	inline function set_specular(value:Int):Int return untyped this.specular = value;
}

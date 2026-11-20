package flight._js;

abstract LambertMaterial(Dynamic) {
	public var diffuse(get, set):Int;
	inline function get_diffuse():Int return untyped this.diffuse;
	inline function set_diffuse(value:Int):Int return untyped this.diffuse = value;
	public var emissive(get, set):Int;
	inline function get_emissive():Int return untyped this.emissive;
	inline function set_emissive(value:Int):Int return untyped this.emissive = value;
}

package flight._js;

abstract BlinnPhongMaterial(Dynamic) {
	public var diffuse(get, set):Int;
	inline function get_diffuse():Int return untyped this["diffuse"];
	inline function set_diffuse(value:Int):Int return untyped this["diffuse"] = value;
	public var normalScale(get, set):Float;
	inline function get_normalScale():Float return untyped this["normalScale"];
	inline function set_normalScale(value:Float):Float return untyped this["normalScale"] = value;
	public var shininess(get, set):Float;
	inline function get_shininess():Float return untyped this["shininess"];
	inline function set_shininess(value:Float):Float return untyped this["shininess"] = value;
	public var specular(get, set):Int;
	inline function get_specular():Int return untyped this["specular"];
	inline function set_specular(value:Int):Int return untyped this["specular"] = value;
}

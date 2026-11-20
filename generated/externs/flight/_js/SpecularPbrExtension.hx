package flight._js;

abstract SpecularPbrExtension(Dynamic) {
	public var specular(get, set):Float;
	inline function get_specular():Float return untyped this.specular;
	inline function set_specular(value:Float):Float return untyped this.specular = value;
	public var specularColor(get, set):Int;
	inline function get_specularColor():Int return untyped this.specularColor;
	inline function set_specularColor(value:Int):Int return untyped this.specularColor = value;
}

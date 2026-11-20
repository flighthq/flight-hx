package flight._js;

abstract ObjMaterial(Dynamic) {
	public var dissolve(get, set):Float;
	inline function get_dissolve():Float return untyped this.dissolve;
	inline function set_dissolve(value:Float):Float return untyped this.dissolve = value;
	public var illumination(get, set):Float;
	inline function get_illumination():Float return untyped this.illumination;
	inline function set_illumination(value:Float):Float return untyped this.illumination = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
	public var specularExponent(get, set):Float;
	inline function get_specularExponent():Float return untyped this.specularExponent;
	inline function set_specularExponent(value:Float):Float return untyped this.specularExponent = value;
}

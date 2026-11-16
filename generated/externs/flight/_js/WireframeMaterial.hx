package flight._js;

abstract WireframeMaterial(Dynamic) {
	public var color(get, set):Int;
	inline function get_color():Int return untyped this["color"];
	inline function set_color(value:Int):Int return untyped this["color"] = value;
	public var thickness(get, set):Float;
	inline function get_thickness():Float return untyped this["thickness"];
	inline function set_thickness(value:Float):Float return untyped this["thickness"] = value;
}

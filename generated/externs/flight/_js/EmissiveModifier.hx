package flight._js;

abstract EmissiveModifier(Dynamic) {
	public var color(get, set):Int;
	inline function get_color():Int return untyped this.color;
	inline function set_color(value:Int):Int return untyped this.color = value;
	public var strength(get, set):Float;
	inline function get_strength():Float return untyped this.strength;
	inline function set_strength(value:Float):Float return untyped this.strength = value;
	public var facingSoftness(get, set):Float;
	inline function get_facingSoftness():Float return untyped this.facingSoftness;
	inline function set_facingSoftness(value:Float):Float return untyped this.facingSoftness = value;
}

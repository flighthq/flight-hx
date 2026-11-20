package flight._js;

abstract AmbientLight(Dynamic) {
	public var color(get, set):Int;
	inline function get_color():Int return untyped this.color;
	inline function set_color(value:Int):Int return untyped this.color = value;
	public var enabled(get, set):Bool;
	inline function get_enabled():Bool return untyped this.enabled;
	inline function set_enabled(value:Bool):Bool return untyped this.enabled = value;
	public var intensity(get, set):Float;
	inline function get_intensity():Float return untyped this.intensity;
	inline function set_intensity(value:Float):Float return untyped this.intensity = value;
}

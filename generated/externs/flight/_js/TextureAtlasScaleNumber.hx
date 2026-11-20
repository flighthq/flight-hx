package flight._js;

abstract TextureAtlasScaleNumber(Dynamic) {
	public var value(get, set):Float;
	inline function get_value():Float return untyped this.value;
	inline function set_value(value:Float):Float return untyped this.value = value;
}

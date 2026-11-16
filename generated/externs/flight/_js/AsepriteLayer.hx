package flight._js;

abstract AsepriteLayer(Dynamic) {
	public var opacity(get, set):Float;
	inline function get_opacity():Float return untyped this.opacity;
	inline function set_opacity(value:Float):Float return untyped this.opacity = value;
}

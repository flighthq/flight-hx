package flight._js;

abstract NormalMaterial(Dynamic) {
	public var normalScale(get, set):Float;
	inline function get_normalScale():Float return untyped this.normalScale;
	inline function set_normalScale(value:Float):Float return untyped this.normalScale = value;
}

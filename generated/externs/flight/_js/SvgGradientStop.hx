package flight._js;

abstract SvgGradientStop(Dynamic) {
	public var offset(get, set):Float;
	inline function get_offset():Float return untyped this.offset;
	inline function set_offset(value:Float):Float return untyped this.offset = value;
}

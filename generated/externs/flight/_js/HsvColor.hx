package flight._js;

abstract HsvColor(Dynamic) {
	public var h(get, set):Float;
	inline function get_h():Float return untyped this.h;
	inline function set_h(value:Float):Float return untyped this.h = value;
	public var s(get, set):Float;
	inline function get_s():Float return untyped this.s;
	inline function set_s(value:Float):Float return untyped this.s = value;
	public var v(get, set):Float;
	inline function get_v():Float return untyped this.v;
	inline function set_v(value:Float):Float return untyped this.v = value;
}

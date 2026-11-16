package flight._js;

abstract Physics3DMassData(Dynamic) {
	public var mass(get, set):Float;
	inline function get_mass():Float return untyped this["mass"];
	inline function set_mass(value:Float):Float return untyped this["mass"] = value;
	public var inertiaXx(get, set):Float;
	inline function get_inertiaXx():Float return untyped this["inertiaXx"];
	inline function set_inertiaXx(value:Float):Float return untyped this["inertiaXx"] = value;
	public var inertiaYy(get, set):Float;
	inline function get_inertiaYy():Float return untyped this["inertiaYy"];
	inline function set_inertiaYy(value:Float):Float return untyped this["inertiaYy"] = value;
	public var inertiaZz(get, set):Float;
	inline function get_inertiaZz():Float return untyped this["inertiaZz"];
	inline function set_inertiaZz(value:Float):Float return untyped this["inertiaZz"] = value;
	public var inertiaXy(get, set):Float;
	inline function get_inertiaXy():Float return untyped this["inertiaXY"];
	inline function set_inertiaXy(value:Float):Float return untyped this["inertiaXY"] = value;
	public var inertiaXz(get, set):Float;
	inline function get_inertiaXz():Float return untyped this["inertiaXz"];
	inline function set_inertiaXz(value:Float):Float return untyped this["inertiaXz"] = value;
	public var inertiaYz(get, set):Float;
	inline function get_inertiaYz():Float return untyped this["inertiaYz"];
	inline function set_inertiaYz(value:Float):Float return untyped this["inertiaYz"] = value;
	public var centerX(get, set):Float;
	inline function get_centerX():Float return untyped this["centerX"];
	inline function set_centerX(value:Float):Float return untyped this["centerX"] = value;
	public var centerY(get, set):Float;
	inline function get_centerY():Float return untyped this["centerY"];
	inline function set_centerY(value:Float):Float return untyped this["centerY"] = value;
	public var centerZ(get, set):Float;
	inline function get_centerZ():Float return untyped this["centerZ"];
	inline function set_centerZ(value:Float):Float return untyped this["centerZ"] = value;
}

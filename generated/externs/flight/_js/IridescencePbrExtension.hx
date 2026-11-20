package flight._js;

abstract IridescencePbrExtension(Dynamic) {
	public var iridescence(get, set):Float;
	inline function get_iridescence():Float return untyped this.iridescence;
	inline function set_iridescence(value:Float):Float return untyped this.iridescence = value;
	public var iridescenceIor(get, set):Float;
	inline function get_iridescenceIor():Float return untyped this.iridescenceIor;
	inline function set_iridescenceIor(value:Float):Float return untyped this.iridescenceIor = value;
	public var iridescenceThicknessMax(get, set):Float;
	inline function get_iridescenceThicknessMax():Float return untyped this.iridescenceThicknessMax;
	inline function set_iridescenceThicknessMax(value:Float):Float return untyped this.iridescenceThicknessMax = value;
	public var iridescenceThicknessMin(get, set):Float;
	inline function get_iridescenceThicknessMin():Float return untyped this.iridescenceThicknessMin;
	inline function set_iridescenceThicknessMin(value:Float):Float return untyped this.iridescenceThicknessMin = value;
}

package flight._hl;

abstract Scene3DHit(hl.Bytes) {
	public var distance(get, set):Float;

	inline function get_distance():Float return this.getF64(32);

	inline function set_distance(value:Float):Float { this.setF64(32, value); return value; }
	public var triangleIndex(get, set):Int;

	inline function get_triangleIndex():Int return this.getI32(40);

	inline function set_triangleIndex(value:Int):Int { this.setI32(40, value); return value; }
	public var u(get, set):Float;

	inline function get_u():Float return this.getF64(48);

	inline function set_u(value:Float):Float { this.setF64(48, value); return value; }
	public var v(get, set):Float;

	inline function get_v():Float return this.getF64(56);

	inline function set_v(value:Float):Float { this.setF64(56, value); return value; }
	public var w(get, set):Float;

	inline function get_w():Float return this.getF64(64);

	inline function set_w(value:Float):Float { this.setF64(64, value); return value; }
	public var pointX(get, set):Float;

	inline function get_pointX():Float return this.getF64(72);

	inline function set_pointX(value:Float):Float { this.setF64(72, value); return value; }
	public var pointY(get, set):Float;

	inline function get_pointY():Float return this.getF64(80);

	inline function set_pointY(value:Float):Float { this.setF64(80, value); return value; }
	public var pointZ(get, set):Float;

	inline function get_pointZ():Float return this.getF64(88);

	inline function set_pointZ(value:Float):Float { this.setF64(88, value); return value; }
	public var normalX(get, set):Float;

	inline function get_normalX():Float return this.getF64(96);

	inline function set_normalX(value:Float):Float { this.setF64(96, value); return value; }
	public var normalY(get, set):Float;

	inline function get_normalY():Float return this.getF64(104);

	inline function set_normalY(value:Float):Float { this.setF64(104, value); return value; }
	public var normalZ(get, set):Float;

	inline function get_normalZ():Float return this.getF64(112);

	inline function set_normalZ(value:Float):Float { this.setF64(112, value); return value; }
}

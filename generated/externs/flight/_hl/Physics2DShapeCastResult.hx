package flight._hl;

abstract Physics2DShapeCastResult(hl.Bytes) {
	public var colliderIndex(get, set):Int;

	inline function get_colliderIndex():Int return this.getI32(32);

	inline function set_colliderIndex(value:Int):Int { this.setI32(32, value); return value; }
	public var fraction(get, set):Float;

	inline function get_fraction():Float return this.getF64(40);

	inline function set_fraction(value:Float):Float { this.setF64(40, value); return value; }
	public var hit(get, set):Bool;

	inline function get_hit():Bool return this.getUI8(48) != 0;

	inline function set_hit(value:Bool):Bool { this.setUI8(48, value ? 1 : 0); return value; }
	public var normalX(get, set):Float;

	inline function get_normalX():Float return this.getF64(56);

	inline function set_normalX(value:Float):Float { this.setF64(56, value); return value; }
	public var normalY(get, set):Float;

	inline function get_normalY():Float return this.getF64(64);

	inline function set_normalY(value:Float):Float { this.setF64(64, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(72);

	inline function set_x(value:Float):Float { this.setF64(72, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(80);

	inline function set_y(value:Float):Float { this.setF64(80, value); return value; }
}

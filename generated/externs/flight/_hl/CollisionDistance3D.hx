package flight._hl;

abstract CollisionDistance3D(hl.Bytes) {
	public var distance(get, set):Float;

	inline function get_distance():Float return this.getF64(0);

	inline function set_distance(value:Float):Float { this.setF64(0, value); return value; }
	public var directionX(get, set):Float;

	inline function get_directionX():Float return this.getF64(8);

	inline function set_directionX(value:Float):Float { this.setF64(8, value); return value; }
	public var directionY(get, set):Float;

	inline function get_directionY():Float return this.getF64(16);

	inline function set_directionY(value:Float):Float { this.setF64(16, value); return value; }
	public var directionZ(get, set):Float;

	inline function get_directionZ():Float return this.getF64(24);

	inline function set_directionZ(value:Float):Float { this.setF64(24, value); return value; }
	public var pointAX(get, set):Float;

	inline function get_pointAX():Float return this.getF64(32);

	inline function set_pointAX(value:Float):Float { this.setF64(32, value); return value; }
	public var pointAY(get, set):Float;

	inline function get_pointAY():Float return this.getF64(40);

	inline function set_pointAY(value:Float):Float { this.setF64(40, value); return value; }
	public var pointAZ(get, set):Float;

	inline function get_pointAZ():Float return this.getF64(48);

	inline function set_pointAZ(value:Float):Float { this.setF64(48, value); return value; }
	public var pointBX(get, set):Float;

	inline function get_pointBX():Float return this.getF64(56);

	inline function set_pointBX(value:Float):Float { this.setF64(56, value); return value; }
	public var pointBY(get, set):Float;

	inline function get_pointBY():Float return this.getF64(64);

	inline function set_pointBY(value:Float):Float { this.setF64(64, value); return value; }
	public var pointBZ(get, set):Float;

	inline function get_pointBZ():Float return this.getF64(72);

	inline function set_pointBZ(value:Float):Float { this.setF64(72, value); return value; }
	public var overlapping(get, set):Bool;

	inline function get_overlapping():Bool return this.getUI8(80) != 0;

	inline function set_overlapping(value:Bool):Bool { this.setUI8(80, value ? 1 : 0); return value; }
}

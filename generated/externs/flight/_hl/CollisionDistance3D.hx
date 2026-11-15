package flight._hl;

abstract CollisionDistance3D(hl.Bytes) {
	public var distance(get, set):Single;

	inline function get_distance():Single return this.getF32(0);

	inline function set_distance(value:Single):Single { this.setF32(0, value); return value; }
	public var directionX(get, set):Single;

	inline function get_directionX():Single return this.getF32(4);

	inline function set_directionX(value:Single):Single { this.setF32(4, value); return value; }
	public var directionY(get, set):Single;

	inline function get_directionY():Single return this.getF32(8);

	inline function set_directionY(value:Single):Single { this.setF32(8, value); return value; }
	public var directionZ(get, set):Single;

	inline function get_directionZ():Single return this.getF32(12);

	inline function set_directionZ(value:Single):Single { this.setF32(12, value); return value; }
	public var pointAX(get, set):Single;

	inline function get_pointAX():Single return this.getF32(16);

	inline function set_pointAX(value:Single):Single { this.setF32(16, value); return value; }
	public var pointAY(get, set):Single;

	inline function get_pointAY():Single return this.getF32(20);

	inline function set_pointAY(value:Single):Single { this.setF32(20, value); return value; }
	public var pointAZ(get, set):Single;

	inline function get_pointAZ():Single return this.getF32(24);

	inline function set_pointAZ(value:Single):Single { this.setF32(24, value); return value; }
	public var pointBX(get, set):Single;

	inline function get_pointBX():Single return this.getF32(28);

	inline function set_pointBX(value:Single):Single { this.setF32(28, value); return value; }
	public var pointBY(get, set):Single;

	inline function get_pointBY():Single return this.getF32(32);

	inline function set_pointBY(value:Single):Single { this.setF32(32, value); return value; }
	public var pointBZ(get, set):Single;

	inline function get_pointBZ():Single return this.getF32(36);

	inline function set_pointBZ(value:Single):Single { this.setF32(36, value); return value; }
	public var overlapping(get, set):Bool;

	inline function get_overlapping():Bool return this.getUI8(40) != 0;

	inline function set_overlapping(value:Bool):Bool { this.setUI8(40, value ? 1 : 0); return value; }
}

package flight._hl;

abstract UnityShape(hl.Bytes) {
	public var angle(get, set):Single;

	inline function get_angle():Single return this.getF32(0);

	inline function set_angle(value:Single):Single { this.setF32(0, value); return value; }
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(4) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(4, value ? 1 : 0); return value; }
	public var radius(get, set):Single;

	inline function get_radius():Single return this.getF32(8);

	inline function set_radius(value:Single):Single { this.setF32(8, value); return value; }
}

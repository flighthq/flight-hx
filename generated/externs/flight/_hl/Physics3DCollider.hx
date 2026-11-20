package flight._hl;

abstract Physics3DCollider(hl.Bytes) {
	public var sensor(get, set):Bool;

	inline function get_sensor():Bool return this.getUI8(236) != 0;

	inline function set_sensor(value:Bool):Bool { this.setUI8(236, value ? 1 : 0); return value; }
}

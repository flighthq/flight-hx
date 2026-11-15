package flight._hl;

abstract Physics2DCollider(hl.Bytes) {
	public var sensor(get, set):Bool;

	inline function get_sensor():Bool return this.getUI8(84) != 0;

	inline function set_sensor(value:Bool):Bool { this.setUI8(84, value ? 1 : 0); return value; }
}

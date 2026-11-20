package flight._hl;

abstract NotificationSchedule(hl.Bytes) {
	public var at(get, set):Single;

	inline function get_at():Single return this.getF32(4);

	inline function set_at(value:Single):Single { this.setF32(4, value); return value; }
}

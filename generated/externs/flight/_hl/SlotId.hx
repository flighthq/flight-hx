package flight._hl;

abstract SlotId(hl.Bytes) {
	public var value(get, set):Int;

	inline function get_value():Int return this.getI32(0);

	inline function set_value(value:Int):Int { this.setI32(0, value); return value; }
}

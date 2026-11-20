package flight._hl;

abstract Awd2CameraEntry(hl.Bytes) {
	public var key(get, set):Int;

	inline function get_key():Int return this.getI32(88);

	inline function set_key(value:Int):Int { this.setI32(88, value); return value; }
}

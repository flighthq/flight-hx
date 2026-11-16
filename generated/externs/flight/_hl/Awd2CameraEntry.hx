package flight._hl;

abstract Awd2CameraEntry(hl.Bytes) {
	public var key(get, set):Int;

	inline function get_key():Int return this.getI32(72);

	inline function set_key(value:Int):Int { this.setI32(72, value); return value; }
}

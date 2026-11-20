package flight._hl;

abstract MidiInputMessage(hl.Bytes) {
	public var timestamp(get, set):Float;

	inline function get_timestamp():Float return this.getF64(16);

	inline function set_timestamp(value:Float):Float { this.setF64(16, value); return value; }
}

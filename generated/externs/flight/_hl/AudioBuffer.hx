package flight._hl;

abstract AudioBuffer(hl.Bytes) {
	public var sampleRate(get, set):Single;

	inline function get_sampleRate():Single return this.getF32(0);

	inline function set_sampleRate(value:Single):Single { this.setF32(0, value); return value; }
	public var length(get, set):Int;

	inline function get_length():Int return this.getI32(8);

	inline function set_length(value:Int):Int { this.setI32(8, value); return value; }
}

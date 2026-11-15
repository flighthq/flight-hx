package flight._hl;

abstract AbcInstruction(hl.Bytes) {
	public var offset(get, set):Int;

	inline function get_offset():Int return this.getI32(0);

	inline function set_offset(value:Int):Int { this.setI32(0, value); return value; }
	public var opcode(get, set):Int;

	inline function get_opcode():Int return this.getUI8(8);

	inline function set_opcode(value:Int):Int { this.setUI8(8, value); return value; }
}

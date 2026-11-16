package flight._js;

abstract AbcInstruction(Dynamic) {
	public var offset(get, set):Int;
	inline function get_offset():Int return untyped this.offset;
	inline function set_offset(value:Int):Int return untyped this.offset = value;
	public var opcode(get, set):Int;
	inline function get_opcode():Int return untyped this.opcode;
	inline function set_opcode(value:Int):Int return untyped this.opcode = value;
}

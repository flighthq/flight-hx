package flight._cpp;

private extern class AbcInstruction_Ffi {
	@:native("flight_get_abc_instruction_offset") static function get_offset(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_abc_instruction_offset") static function set_offset(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_abc_instruction_opcode") static function get_opcode(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_abc_instruction_opcode") static function set_opcode(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract AbcInstruction(cpp.Star<cpp.Void>) {
	public var offset(get, set):Int;

	inline function get_offset():Int return AbcInstruction_Ffi.get_offset(this);

	inline function set_offset(value:Int):Int { AbcInstruction_Ffi.set_offset(this, value); return value; }
	public var opcode(get, set):Int;

	inline function get_opcode():Int return AbcInstruction_Ffi.get_opcode(this);

	inline function set_opcode(value:Int):Int { AbcInstruction_Ffi.set_opcode(this, value); return value; }
}

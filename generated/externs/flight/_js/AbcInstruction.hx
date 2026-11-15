package flight._js;

@:jsRequire("flight")
private extern class AbcInstruction_Ffi {
	@:native("flight_get_abc_instruction_offset") static function get_offset(ptr:Dynamic):Int;
	@:native("flight_set_abc_instruction_offset") static function set_offset(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_abc_instruction_opcode") static function get_opcode(ptr:Dynamic):Int;
	@:native("flight_set_abc_instruction_opcode") static function set_opcode(ptr:Dynamic, value:Int):Int;
}

abstract AbcInstruction(Dynamic) {
	public var offset(get, set):Int;

	inline function get_offset():Int return AbcInstruction_Ffi.get_offset(this);

	inline function set_offset(value:Int):Int return AbcInstruction_Ffi.set_offset(this, value);
	public var opcode(get, set):Int;

	inline function get_opcode():Int return AbcInstruction_Ffi.get_opcode(this);

	inline function set_opcode(value:Int):Int return AbcInstruction_Ffi.set_opcode(this, value);
}

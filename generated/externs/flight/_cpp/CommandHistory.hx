package flight._cpp;

private extern class CommandHistory_Ffi {
	@:native("flight_get_command_history_index") static function get_index(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_command_history_index") static function set_index(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_command_history_max_size") static function get_maxSize(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_command_history_max_size") static function set_maxSize(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_command_history_transaction_depth") static function get_transactionDepth(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_command_history_transaction_depth") static function set_transactionDepth(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_command_history_transaction_index") static function get_transactionIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_command_history_transaction_index") static function set_transactionIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract CommandHistory(cpp.Star<cpp.Void>) {
	public var index(get, set):Int;

	inline function get_index():Int return CommandHistory_Ffi.get_index(this);

	inline function set_index(value:Int):Int { CommandHistory_Ffi.set_index(this, value); return value; }
	public var maxSize(get, set):Int;

	inline function get_maxSize():Int return CommandHistory_Ffi.get_maxSize(this);

	inline function set_maxSize(value:Int):Int { CommandHistory_Ffi.set_maxSize(this, value); return value; }
	public var transactionDepth(get, set):Int;

	inline function get_transactionDepth():Int return CommandHistory_Ffi.get_transactionDepth(this);

	inline function set_transactionDepth(value:Int):Int { CommandHistory_Ffi.set_transactionDepth(this, value); return value; }
	public var transactionIndex(get, set):Int;

	inline function get_transactionIndex():Int return CommandHistory_Ffi.get_transactionIndex(this);

	inline function set_transactionIndex(value:Int):Int { CommandHistory_Ffi.set_transactionIndex(this, value); return value; }
}

package flight._cpp;

private extern class CommandDispatchExplanation_Ffi {
	@:native("flight_get_command_dispatch_explanation_resolved") static function get_resolved(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_command_dispatch_explanation_resolved") static function set_resolved(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract CommandDispatchExplanation(cpp.Star<cpp.Void>) {
	public var resolved(get, set):Bool;

	inline function get_resolved():Bool return CommandDispatchExplanation_Ffi.get_resolved(this);

	inline function set_resolved(value:Bool):Bool { CommandDispatchExplanation_Ffi.set_resolved(this, value); return value; }
}

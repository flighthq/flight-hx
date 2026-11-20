package flight._cpp;

private extern class BackendExplanation_Ffi {
	@:native("flight_get_backend_explanation_conflict") static function get_conflict(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_backend_explanation_conflict") static function set_conflict(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract BackendExplanation(cpp.Star<cpp.Void>) {
	public var conflict(get, set):Bool;

	inline function get_conflict():Bool return BackendExplanation_Ffi.get_conflict(this);

	inline function set_conflict(value:Bool):Bool { BackendExplanation_Ffi.set_conflict(this, value); return value; }
}

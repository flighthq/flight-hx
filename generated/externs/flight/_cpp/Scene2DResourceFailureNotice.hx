package flight._cpp;

private extern class Scene2DResourceFailureNotice_Ffi {
	@:native("flight_get_scene2_dresource_failure_notice_total") static function get_total(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_scene2_dresource_failure_notice_total") static function set_total(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_scene2_dresource_failure_notice_unresolved") static function get_unresolved(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_scene2_dresource_failure_notice_unresolved") static function set_unresolved(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Scene2DResourceFailureNotice(cpp.Star<cpp.Void>) {
	public var total(get, set):Int;

	inline function get_total():Int return Scene2DResourceFailureNotice_Ffi.get_total(this);

	inline function set_total(value:Int):Int { Scene2DResourceFailureNotice_Ffi.set_total(this, value); return value; }
	public var unresolved(get, set):Int;

	inline function get_unresolved():Int return Scene2DResourceFailureNotice_Ffi.get_unresolved(this);

	inline function set_unresolved(value:Int):Int { Scene2DResourceFailureNotice_Ffi.set_unresolved(this, value); return value; }
}

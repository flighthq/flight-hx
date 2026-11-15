package flight._js;

@:jsRequire("flight")
private extern class TweenPropertyDetail_Ffi {
	@:native("flight_get_tween_property_detail_change") static function get_change(ptr:Dynamic):Float;
	@:native("flight_set_tween_property_detail_change") static function set_change(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_tween_property_detail_start") static function get_start(ptr:Dynamic):Float;
	@:native("flight_set_tween_property_detail_start") static function set_start(ptr:Dynamic, value:Float):Float;
}

abstract TweenPropertyDetail(Dynamic) {
	public var change(get, set):Float;

	inline function get_change():Float return TweenPropertyDetail_Ffi.get_change(this);

	inline function set_change(value:Float):Float return TweenPropertyDetail_Ffi.set_change(this, value);
	public var start(get, set):Float;

	inline function get_start():Float return TweenPropertyDetail_Ffi.get_start(this);

	inline function set_start(value:Float):Float return TweenPropertyDetail_Ffi.set_start(this, value);
}

package flight._js;

@:jsRequire("flight")
private extern class UnityShape_Ffi {
	@:native("flight_get_unity_shape_angle") static function get_angle(ptr:Dynamic):Float;
	@:native("flight_set_unity_shape_angle") static function set_angle(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_unity_shape_enabled") static function get_enabled(ptr:Dynamic):Bool;
	@:native("flight_set_unity_shape_enabled") static function set_enabled(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_unity_shape_radius") static function get_radius(ptr:Dynamic):Float;
	@:native("flight_set_unity_shape_radius") static function set_radius(ptr:Dynamic, value:Float):Float;
}

abstract UnityShape(Dynamic) {
	public var angle(get, set):Float;

	inline function get_angle():Float return UnityShape_Ffi.get_angle(this);

	inline function set_angle(value:Float):Float return UnityShape_Ffi.set_angle(this, value);
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return UnityShape_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return UnityShape_Ffi.set_enabled(this, value);
	public var radius(get, set):Float;

	inline function get_radius():Float return UnityShape_Ffi.get_radius(this);

	inline function set_radius(value:Float):Float return UnityShape_Ffi.set_radius(this, value);
}

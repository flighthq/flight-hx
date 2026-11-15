package flight._js;

@:jsRequire("flight")
private extern class Physics2DShapeCastResult_Ffi {
	@:native("flight_get_physics2_dshape_cast_result_collider_index") static function get_colliderIndex(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dshape_cast_result_collider_index") static function set_colliderIndex(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_dshape_cast_result_fraction") static function get_fraction(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dshape_cast_result_fraction") static function set_fraction(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dshape_cast_result_hit") static function get_hit(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_dshape_cast_result_hit") static function set_hit(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_physics2_dshape_cast_result_normal_x") static function get_normalX(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dshape_cast_result_normal_x") static function set_normalX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dshape_cast_result_normal_y") static function get_normalY(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dshape_cast_result_normal_y") static function set_normalY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dshape_cast_result_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dshape_cast_result_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dshape_cast_result_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dshape_cast_result_y") static function set_y(ptr:Dynamic, value:Float):Float;
}

abstract Physics2DShapeCastResult(Dynamic) {
	public var colliderIndex(get, set):Int;

	inline function get_colliderIndex():Int return Physics2DShapeCastResult_Ffi.get_colliderIndex(this);

	inline function set_colliderIndex(value:Int):Int return Physics2DShapeCastResult_Ffi.set_colliderIndex(this, value);
	public var fraction(get, set):Float;

	inline function get_fraction():Float return Physics2DShapeCastResult_Ffi.get_fraction(this);

	inline function set_fraction(value:Float):Float return Physics2DShapeCastResult_Ffi.set_fraction(this, value);
	public var hit(get, set):Bool;

	inline function get_hit():Bool return Physics2DShapeCastResult_Ffi.get_hit(this);

	inline function set_hit(value:Bool):Bool return Physics2DShapeCastResult_Ffi.set_hit(this, value);
	public var normalX(get, set):Float;

	inline function get_normalX():Float return Physics2DShapeCastResult_Ffi.get_normalX(this);

	inline function set_normalX(value:Float):Float return Physics2DShapeCastResult_Ffi.set_normalX(this, value);
	public var normalY(get, set):Float;

	inline function get_normalY():Float return Physics2DShapeCastResult_Ffi.get_normalY(this);

	inline function set_normalY(value:Float):Float return Physics2DShapeCastResult_Ffi.set_normalY(this, value);
	public var x(get, set):Float;

	inline function get_x():Float return Physics2DShapeCastResult_Ffi.get_x(this);

	inline function set_x(value:Float):Float return Physics2DShapeCastResult_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return Physics2DShapeCastResult_Ffi.get_y(this);

	inline function set_y(value:Float):Float return Physics2DShapeCastResult_Ffi.set_y(this, value);
}

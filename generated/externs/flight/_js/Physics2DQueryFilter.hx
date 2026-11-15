package flight._js;

@:jsRequire("flight")
private extern class Physics2DQueryFilter_Ffi {
	@:native("flight_get_physics2_dquery_filter_category_bits") static function get_categoryBits(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dquery_filter_category_bits") static function set_categoryBits(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_dquery_filter_include_dynamic") static function get_includeDynamic(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_dquery_filter_include_dynamic") static function set_includeDynamic(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_physics2_dquery_filter_include_kinematic") static function get_includeKinematic(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_dquery_filter_include_kinematic") static function set_includeKinematic(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_physics2_dquery_filter_include_sensors") static function get_includeSensors(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_dquery_filter_include_sensors") static function set_includeSensors(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_physics2_dquery_filter_include_static") static function get_includeStatic(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_dquery_filter_include_static") static function set_includeStatic(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_physics2_dquery_filter_mask_bits") static function get_maskBits(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dquery_filter_mask_bits") static function set_maskBits(ptr:Dynamic, value:Int):Int;
}

abstract Physics2DQueryFilter(Dynamic) {
	public var categoryBits(get, set):Int;

	inline function get_categoryBits():Int return Physics2DQueryFilter_Ffi.get_categoryBits(this);

	inline function set_categoryBits(value:Int):Int return Physics2DQueryFilter_Ffi.set_categoryBits(this, value);
	public var includeDynamic(get, set):Bool;

	inline function get_includeDynamic():Bool return Physics2DQueryFilter_Ffi.get_includeDynamic(this);

	inline function set_includeDynamic(value:Bool):Bool return Physics2DQueryFilter_Ffi.set_includeDynamic(this, value);
	public var includeKinematic(get, set):Bool;

	inline function get_includeKinematic():Bool return Physics2DQueryFilter_Ffi.get_includeKinematic(this);

	inline function set_includeKinematic(value:Bool):Bool return Physics2DQueryFilter_Ffi.set_includeKinematic(this, value);
	public var includeSensors(get, set):Bool;

	inline function get_includeSensors():Bool return Physics2DQueryFilter_Ffi.get_includeSensors(this);

	inline function set_includeSensors(value:Bool):Bool return Physics2DQueryFilter_Ffi.set_includeSensors(this, value);
	public var includeStatic(get, set):Bool;

	inline function get_includeStatic():Bool return Physics2DQueryFilter_Ffi.get_includeStatic(this);

	inline function set_includeStatic(value:Bool):Bool return Physics2DQueryFilter_Ffi.set_includeStatic(this, value);
	public var maskBits(get, set):Int;

	inline function get_maskBits():Int return Physics2DQueryFilter_Ffi.get_maskBits(this);

	inline function set_maskBits(value:Int):Int return Physics2DQueryFilter_Ffi.set_maskBits(this, value);
}

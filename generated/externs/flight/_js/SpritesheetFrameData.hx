package flight._js;

@:jsRequire("flight")
private extern class SpritesheetFrameData_Ffi {
	@:native("flight_get_spritesheet_frame_data_height") static function get_height(ptr:Dynamic):Float;
	@:native("flight_set_spritesheet_frame_data_height") static function set_height(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spritesheet_frame_data_offset_x") static function get_offsetX(ptr:Dynamic):Float;
	@:native("flight_set_spritesheet_frame_data_offset_x") static function set_offsetX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spritesheet_frame_data_offset_y") static function get_offsetY(ptr:Dynamic):Float;
	@:native("flight_set_spritesheet_frame_data_offset_y") static function set_offsetY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spritesheet_frame_data_rotated") static function get_rotated(ptr:Dynamic):Bool;
	@:native("flight_set_spritesheet_frame_data_rotated") static function set_rotated(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_spritesheet_frame_data_source_height") static function get_sourceHeight(ptr:Dynamic):Float;
	@:native("flight_set_spritesheet_frame_data_source_height") static function set_sourceHeight(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spritesheet_frame_data_source_width") static function get_sourceWidth(ptr:Dynamic):Float;
	@:native("flight_set_spritesheet_frame_data_source_width") static function set_sourceWidth(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spritesheet_frame_data_width") static function get_width(ptr:Dynamic):Float;
	@:native("flight_set_spritesheet_frame_data_width") static function set_width(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spritesheet_frame_data_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_spritesheet_frame_data_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spritesheet_frame_data_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_spritesheet_frame_data_y") static function set_y(ptr:Dynamic, value:Float):Float;
}

abstract SpritesheetFrameData(Dynamic) {
	public var height(get, set):Float;

	inline function get_height():Float return SpritesheetFrameData_Ffi.get_height(this);

	inline function set_height(value:Float):Float return SpritesheetFrameData_Ffi.set_height(this, value);
	public var offsetX(get, set):Float;

	inline function get_offsetX():Float return SpritesheetFrameData_Ffi.get_offsetX(this);

	inline function set_offsetX(value:Float):Float return SpritesheetFrameData_Ffi.set_offsetX(this, value);
	public var offsetY(get, set):Float;

	inline function get_offsetY():Float return SpritesheetFrameData_Ffi.get_offsetY(this);

	inline function set_offsetY(value:Float):Float return SpritesheetFrameData_Ffi.set_offsetY(this, value);
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return SpritesheetFrameData_Ffi.get_rotated(this);

	inline function set_rotated(value:Bool):Bool return SpritesheetFrameData_Ffi.set_rotated(this, value);
	public var sourceHeight(get, set):Float;

	inline function get_sourceHeight():Float return SpritesheetFrameData_Ffi.get_sourceHeight(this);

	inline function set_sourceHeight(value:Float):Float return SpritesheetFrameData_Ffi.set_sourceHeight(this, value);
	public var sourceWidth(get, set):Float;

	inline function get_sourceWidth():Float return SpritesheetFrameData_Ffi.get_sourceWidth(this);

	inline function set_sourceWidth(value:Float):Float return SpritesheetFrameData_Ffi.set_sourceWidth(this, value);
	public var width(get, set):Float;

	inline function get_width():Float return SpritesheetFrameData_Ffi.get_width(this);

	inline function set_width(value:Float):Float return SpritesheetFrameData_Ffi.set_width(this, value);
	public var x(get, set):Float;

	inline function get_x():Float return SpritesheetFrameData_Ffi.get_x(this);

	inline function set_x(value:Float):Float return SpritesheetFrameData_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return SpritesheetFrameData_Ffi.get_y(this);

	inline function set_y(value:Float):Float return SpritesheetFrameData_Ffi.set_y(this, value);
}

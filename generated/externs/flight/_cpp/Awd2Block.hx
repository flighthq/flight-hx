package flight._cpp;

private extern class Awd2Block_Ffi {
	@:native("flight_get_awd2_block_block_id") static function get_blockId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_block_block_id") static function set_blockId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_block_block_type") static function get_blockType(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_block_block_type") static function set_blockType(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_block_data_end") static function get_dataEnd(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_block_data_end") static function set_dataEnd(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_block_data_start") static function get_dataStart(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_block_data_start") static function set_dataStart(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_block_geometry_wide") static function get_geometryWide(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_awd2_block_geometry_wide") static function set_geometryWide(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_awd2_block_matrix_wide") static function get_matrixWide(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_awd2_block_matrix_wide") static function set_matrixWide(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Awd2Block(cpp.Star<cpp.Void>) {
	public var blockId(get, set):Int;

	inline function get_blockId():Int return Awd2Block_Ffi.get_blockId(this);

	inline function set_blockId(value:Int):Int { Awd2Block_Ffi.set_blockId(this, value); return value; }
	public var blockType(get, set):Int;

	inline function get_blockType():Int return Awd2Block_Ffi.get_blockType(this);

	inline function set_blockType(value:Int):Int { Awd2Block_Ffi.set_blockType(this, value); return value; }
	public var dataEnd(get, set):Int;

	inline function get_dataEnd():Int return Awd2Block_Ffi.get_dataEnd(this);

	inline function set_dataEnd(value:Int):Int { Awd2Block_Ffi.set_dataEnd(this, value); return value; }
	public var dataStart(get, set):Int;

	inline function get_dataStart():Int return Awd2Block_Ffi.get_dataStart(this);

	inline function set_dataStart(value:Int):Int { Awd2Block_Ffi.set_dataStart(this, value); return value; }
	public var geometryWide(get, set):Bool;

	inline function get_geometryWide():Bool return Awd2Block_Ffi.get_geometryWide(this);

	inline function set_geometryWide(value:Bool):Bool { Awd2Block_Ffi.set_geometryWide(this, value); return value; }
	public var matrixWide(get, set):Bool;

	inline function get_matrixWide():Bool return Awd2Block_Ffi.get_matrixWide(this);

	inline function set_matrixWide(value:Bool):Bool { Awd2Block_Ffi.set_matrixWide(this, value); return value; }
}

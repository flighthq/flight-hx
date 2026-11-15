package flight._cpp;

private extern class Scene3DLightBlock_Ffi {
	@:native("flight_get_scene3_dlight_block_ambient_count") static function get_ambientCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_scene3_dlight_block_ambient_count") static function set_ambientCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_scene3_dlight_block_directional_count") static function get_directionalCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_scene3_dlight_block_directional_count") static function set_directionalCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_scene3_dlight_block_hemisphere_count") static function get_hemisphereCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_scene3_dlight_block_hemisphere_count") static function set_hemisphereCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_scene3_dlight_block_point_count") static function get_pointCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_scene3_dlight_block_point_count") static function set_pointCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_scene3_dlight_block_spot_count") static function get_spotCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_scene3_dlight_block_spot_count") static function set_spotCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_scene3_dlight_block_version") static function get_version(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_scene3_dlight_block_version") static function set_version(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Scene3DLightBlock(cpp.Star<cpp.Void>) {
	public var ambientCount(get, set):Int;

	inline function get_ambientCount():Int return Scene3DLightBlock_Ffi.get_ambientCount(this);

	inline function set_ambientCount(value:Int):Int return Scene3DLightBlock_Ffi.set_ambientCount(this, value);
	public var directionalCount(get, set):Int;

	inline function get_directionalCount():Int return Scene3DLightBlock_Ffi.get_directionalCount(this);

	inline function set_directionalCount(value:Int):Int return Scene3DLightBlock_Ffi.set_directionalCount(this, value);
	public var hemisphereCount(get, set):Int;

	inline function get_hemisphereCount():Int return Scene3DLightBlock_Ffi.get_hemisphereCount(this);

	inline function set_hemisphereCount(value:Int):Int return Scene3DLightBlock_Ffi.set_hemisphereCount(this, value);
	public var pointCount(get, set):Int;

	inline function get_pointCount():Int return Scene3DLightBlock_Ffi.get_pointCount(this);

	inline function set_pointCount(value:Int):Int return Scene3DLightBlock_Ffi.set_pointCount(this, value);
	public var spotCount(get, set):Int;

	inline function get_spotCount():Int return Scene3DLightBlock_Ffi.get_spotCount(this);

	inline function set_spotCount(value:Int):Int return Scene3DLightBlock_Ffi.set_spotCount(this, value);
	public var version(get, set):Int;

	inline function get_version():Int return Scene3DLightBlock_Ffi.get_version(this);

	inline function set_version(value:Int):Int return Scene3DLightBlock_Ffi.set_version(this, value);
}

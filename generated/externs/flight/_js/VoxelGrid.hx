package flight._js;

@:jsRequire("flight")
private extern class VoxelGrid_Ffi {
	@:native("flight_get_voxel_grid_depth") static function get_depth(ptr:Dynamic):Int;
	@:native("flight_set_voxel_grid_depth") static function set_depth(ptr:Dynamic, value:Int):Int;
}

abstract VoxelGrid(Dynamic) {
	public var depth(get, set):Int;

	inline function get_depth():Int return VoxelGrid_Ffi.get_depth(this);

	inline function set_depth(value:Int):Int return VoxelGrid_Ffi.set_depth(this, value);
}

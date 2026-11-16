package flight._cpp;

private extern class VoxelGrid_Ffi {
	@:native("flight_get_voxel_grid_depth") static function get_depth(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_voxel_grid_depth") static function set_depth(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract VoxelGrid(cpp.Star<cpp.Void>) {
	public var depth(get, set):Int;

	inline function get_depth():Int return VoxelGrid_Ffi.get_depth(this);

	inline function set_depth(value:Int):Int { VoxelGrid_Ffi.set_depth(this, value); return value; }
}

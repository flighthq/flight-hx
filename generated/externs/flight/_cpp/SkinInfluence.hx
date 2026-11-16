package flight._cpp;

private extern class SkinInfluence_Ffi {
	@:native("flight_get_skin_influence_joint_index") static function get_jointIndex(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skin_influence_joint_index") static function set_jointIndex(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_skin_influence_weight") static function get_weight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_skin_influence_weight") static function set_weight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SkinInfluence(cpp.Star<cpp.Void>) {
	public var jointIndex(get, set):Single;

	inline function get_jointIndex():Single return SkinInfluence_Ffi.get_jointIndex(this);

	inline function set_jointIndex(value:Single):Single { SkinInfluence_Ffi.set_jointIndex(this, value); return value; }
	public var weight(get, set):Single;

	inline function get_weight():Single return SkinInfluence_Ffi.get_weight(this);

	inline function set_weight(value:Single):Single { SkinInfluence_Ffi.set_weight(this, value); return value; }
}

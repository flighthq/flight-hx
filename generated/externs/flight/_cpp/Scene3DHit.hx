package flight._cpp;

private extern class Scene3DHit_Ffi {
	@:native("flight_get_scene3_dhit_distance") static function get_distance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_scene3_dhit_distance") static function set_distance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_scene3_dhit_triangle_index") static function get_triangleIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_scene3_dhit_triangle_index") static function set_triangleIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_scene3_dhit_u") static function get_u(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_scene3_dhit_u") static function set_u(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_scene3_dhit_v") static function get_v(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_scene3_dhit_v") static function set_v(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_scene3_dhit_w") static function get_w(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_scene3_dhit_w") static function set_w(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_scene3_dhit_point_x") static function get_pointX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_scene3_dhit_point_x") static function set_pointX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_scene3_dhit_point_y") static function get_pointY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_scene3_dhit_point_y") static function set_pointY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_scene3_dhit_point_z") static function get_pointZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_scene3_dhit_point_z") static function set_pointZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_scene3_dhit_normal_x") static function get_normalX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_scene3_dhit_normal_x") static function set_normalX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_scene3_dhit_normal_y") static function get_normalY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_scene3_dhit_normal_y") static function set_normalY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_scene3_dhit_normal_z") static function get_normalZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_scene3_dhit_normal_z") static function set_normalZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Scene3DHit(cpp.Star<cpp.Void>) {
	public var distance(get, set):Single;

	inline function get_distance():Single return Scene3DHit_Ffi.get_distance(this);

	inline function set_distance(value:Single):Single { Scene3DHit_Ffi.set_distance(this, value); return value; }
	public var triangleIndex(get, set):Int;

	inline function get_triangleIndex():Int return Scene3DHit_Ffi.get_triangleIndex(this);

	inline function set_triangleIndex(value:Int):Int { Scene3DHit_Ffi.set_triangleIndex(this, value); return value; }
	public var u(get, set):Single;

	inline function get_u():Single return Scene3DHit_Ffi.get_u(this);

	inline function set_u(value:Single):Single { Scene3DHit_Ffi.set_u(this, value); return value; }
	public var v(get, set):Single;

	inline function get_v():Single return Scene3DHit_Ffi.get_v(this);

	inline function set_v(value:Single):Single { Scene3DHit_Ffi.set_v(this, value); return value; }
	public var w(get, set):Single;

	inline function get_w():Single return Scene3DHit_Ffi.get_w(this);

	inline function set_w(value:Single):Single { Scene3DHit_Ffi.set_w(this, value); return value; }
	public var pointX(get, set):Single;

	inline function get_pointX():Single return Scene3DHit_Ffi.get_pointX(this);

	inline function set_pointX(value:Single):Single { Scene3DHit_Ffi.set_pointX(this, value); return value; }
	public var pointY(get, set):Single;

	inline function get_pointY():Single return Scene3DHit_Ffi.get_pointY(this);

	inline function set_pointY(value:Single):Single { Scene3DHit_Ffi.set_pointY(this, value); return value; }
	public var pointZ(get, set):Single;

	inline function get_pointZ():Single return Scene3DHit_Ffi.get_pointZ(this);

	inline function set_pointZ(value:Single):Single { Scene3DHit_Ffi.set_pointZ(this, value); return value; }
	public var normalX(get, set):Single;

	inline function get_normalX():Single return Scene3DHit_Ffi.get_normalX(this);

	inline function set_normalX(value:Single):Single { Scene3DHit_Ffi.set_normalX(this, value); return value; }
	public var normalY(get, set):Single;

	inline function get_normalY():Single return Scene3DHit_Ffi.get_normalY(this);

	inline function set_normalY(value:Single):Single { Scene3DHit_Ffi.set_normalY(this, value); return value; }
	public var normalZ(get, set):Single;

	inline function get_normalZ():Single return Scene3DHit_Ffi.get_normalZ(this);

	inline function set_normalZ(value:Single):Single { Scene3DHit_Ffi.set_normalZ(this, value); return value; }
}

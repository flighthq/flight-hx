package flight._cpp;

private extern class Md5Vertex_Ffi {
	@:native("flight_get_md5_vertex_count_weights") static function get_countWeights(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_md5_vertex_count_weights") static function set_countWeights(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_md5_vertex_start_weight") static function get_startWeight(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_md5_vertex_start_weight") static function set_startWeight(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_md5_vertex_u") static function get_u(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_md5_vertex_u") static function set_u(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_md5_vertex_v") static function get_v(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_md5_vertex_v") static function set_v(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Md5Vertex(cpp.Star<cpp.Void>) {
	public var countWeights(get, set):Int;

	inline function get_countWeights():Int return Md5Vertex_Ffi.get_countWeights(this);

	inline function set_countWeights(value:Int):Int { Md5Vertex_Ffi.set_countWeights(this, value); return value; }
	public var startWeight(get, set):Int;

	inline function get_startWeight():Int return Md5Vertex_Ffi.get_startWeight(this);

	inline function set_startWeight(value:Int):Int { Md5Vertex_Ffi.set_startWeight(this, value); return value; }
	public var u(get, set):Float;

	inline function get_u():Float return Md5Vertex_Ffi.get_u(this);

	inline function set_u(value:Float):Float { Md5Vertex_Ffi.set_u(this, value); return value; }
	public var v(get, set):Float;

	inline function get_v():Float return Md5Vertex_Ffi.get_v(this);

	inline function set_v(value:Float):Float { Md5Vertex_Ffi.set_v(this, value); return value; }
}

package flight._cpp;

private extern class RiveArtboardGraph_Ffi {
	@:native("flight_get_rive_artboard_graph_stream_end") static function get_streamEnd(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_rive_artboard_graph_stream_end") static function set_streamEnd(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_rive_artboard_graph_stream_start") static function get_streamStart(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_rive_artboard_graph_stream_start") static function set_streamStart(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract RiveArtboardGraph(cpp.Star<cpp.Void>) {
	public var streamEnd(get, set):Int;

	inline function get_streamEnd():Int return RiveArtboardGraph_Ffi.get_streamEnd(this);

	inline function set_streamEnd(value:Int):Int { RiveArtboardGraph_Ffi.set_streamEnd(this, value); return value; }
	public var streamStart(get, set):Int;

	inline function get_streamStart():Int return RiveArtboardGraph_Ffi.get_streamStart(this);

	inline function set_streamStart(value:Int):Int { RiveArtboardGraph_Ffi.set_streamStart(this, value); return value; }
}

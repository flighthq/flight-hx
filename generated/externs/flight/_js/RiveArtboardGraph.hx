package flight._js;

abstract RiveArtboardGraph(Dynamic) {
	public var streamEnd(get, set):Int;
	inline function get_streamEnd():Int return untyped this["streamEnd"];
	inline function set_streamEnd(value:Int):Int return untyped this["streamEnd"] = value;
	public var streamStart(get, set):Int;
	inline function get_streamStart():Int return untyped this["streamStart"];
	inline function set_streamStart(value:Int):Int return untyped this["streamStart"] = value;
}

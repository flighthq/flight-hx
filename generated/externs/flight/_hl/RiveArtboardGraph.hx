package flight._hl;

abstract RiveArtboardGraph(hl.Bytes) {
	public var streamEnd(get, set):Int;

	inline function get_streamEnd():Int return this.getI32(48);

	inline function set_streamEnd(value:Int):Int { this.setI32(48, value); return value; }
	public var streamStart(get, set):Int;

	inline function get_streamStart():Int return this.getI32(56);

	inline function set_streamStart(value:Int):Int { this.setI32(56, value); return value; }
}

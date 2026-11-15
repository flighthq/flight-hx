package flight._hl;

abstract RivePathRecord(hl.Bytes) {
	public var pathIndex(get, set):Int;

	inline function get_pathIndex():Int return this.getI32(48);

	inline function set_pathIndex(value:Int):Int { this.setI32(48, value); return value; }
}

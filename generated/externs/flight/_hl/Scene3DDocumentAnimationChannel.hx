package flight._hl;

abstract Scene3DDocumentAnimationChannel(hl.Bytes) {
	public var node(get, set):Int;

	inline function get_node():Int return this.getI32(8);

	inline function set_node(value:Int):Int { this.setI32(8, value); return value; }
}

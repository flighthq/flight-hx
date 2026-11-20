package flight._hl;

abstract BitmapTextPage(hl.Bytes) {
	public var instanceCount(get, set):Int;

	inline function get_instanceCount():Int return this.getI32(40);

	inline function set_instanceCount(value:Int):Int { this.setI32(40, value); return value; }
}

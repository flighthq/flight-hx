package flight._hl;

abstract Physics3DQueryHit(hl.Bytes) {
	public var colliderIndex(get, set):Int;

	inline function get_colliderIndex():Int return this.getI32(16);

	inline function set_colliderIndex(value:Int):Int { this.setI32(16, value); return value; }
}

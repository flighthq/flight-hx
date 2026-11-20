package flight._hl;

abstract ResourceLoadBytes(hl.Bytes) {
	public var bytesLoaded(get, set):Single;

	inline function get_bytesLoaded():Single return this.getF32(8);

	inline function set_bytesLoaded(value:Single):Single { this.setF32(8, value); return value; }
	public var bytesTotalKnown(get, set):Single;

	inline function get_bytesTotalKnown():Single return this.getF32(12);

	inline function set_bytesTotalKnown(value:Single):Single { this.setF32(12, value); return value; }
	public var itemsWithKnownBytes(get, set):Int;

	inline function get_itemsWithKnownBytes():Int return this.getI32(0);

	inline function set_itemsWithKnownBytes(value:Int):Int { this.setI32(0, value); return value; }
}

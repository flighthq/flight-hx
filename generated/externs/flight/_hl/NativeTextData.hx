package flight._hl;

abstract NativeTextData(hl.Bytes) {
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(20);

	inline function set_height(value:Single):Single { this.setF32(20, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(60);

	inline function set_width(value:Single):Single { this.setF32(60, value); return value; }
}

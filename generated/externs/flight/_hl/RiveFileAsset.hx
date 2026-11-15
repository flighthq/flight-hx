package flight._hl;

abstract RiveFileAsset(hl.Bytes) {
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(40);

	inline function set_height(value:Single):Single { this.setF32(40, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(96);

	inline function set_width(value:Single):Single { this.setF32(96, value); return value; }
}

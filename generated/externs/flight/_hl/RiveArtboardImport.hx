package flight._hl;

abstract RiveArtboardImport(hl.Bytes) {
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(48);

	inline function set_height(value:Single):Single { this.setF32(48, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(344);

	inline function set_width(value:Single):Single { this.setF32(344, value); return value; }
}

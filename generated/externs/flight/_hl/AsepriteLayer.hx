package flight._hl;

abstract AsepriteLayer(hl.Bytes) {
	public var opacity(get, set):Single;

	inline function get_opacity():Single return this.getF32(48);

	inline function set_opacity(value:Single):Single { this.setF32(48, value); return value; }
}

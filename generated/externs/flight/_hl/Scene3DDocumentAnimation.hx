package flight._hl;

abstract Scene3DDocumentAnimation(hl.Bytes) {
	public var duration(get, set):Single;

	inline function get_duration():Single return this.getF32(48);

	inline function set_duration(value:Single):Single { this.setF32(48, value); return value; }
}

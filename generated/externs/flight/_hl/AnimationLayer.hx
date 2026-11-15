package flight._hl;

abstract AnimationLayer(hl.Bytes) {
	public var additive(get, set):Bool;

	inline function get_additive():Bool return this.getUI8(0) != 0;

	inline function set_additive(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var weight(get, set):Single;

	inline function get_weight():Single return this.getF32(48);

	inline function set_weight(value:Single):Single { this.setF32(48, value); return value; }
}

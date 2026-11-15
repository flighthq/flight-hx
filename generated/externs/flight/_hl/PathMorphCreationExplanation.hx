package flight._hl;

abstract PathMorphCreationExplanation(hl.Bytes) {
	public var supported(get, set):Bool;

	inline function get_supported():Bool return this.getUI8(0) != 0;

	inline function set_supported(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
}

package flight._hl;

abstract MovieClipGuardState(hl.Bytes) {
	public var movieClipGuardsEnabled(get, set):Bool;

	inline function get_movieClipGuardsEnabled():Bool return this.getUI8(0) != 0;

	inline function set_movieClipGuardsEnabled(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
}

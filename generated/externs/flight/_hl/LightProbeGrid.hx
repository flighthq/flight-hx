package flight._hl;

abstract LightProbeGrid(hl.Bytes) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(96) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(96, value ? 1 : 0); return value; }
}

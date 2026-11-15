package flight._hl;

abstract UnityColorOverLifetime(hl.Bytes) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(32) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(32, value ? 1 : 0); return value; }
}

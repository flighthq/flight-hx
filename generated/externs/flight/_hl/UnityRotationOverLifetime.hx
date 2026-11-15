package flight._hl;

abstract UnityRotationOverLifetime(hl.Bytes) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(28) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(28, value ? 1 : 0); return value; }
}

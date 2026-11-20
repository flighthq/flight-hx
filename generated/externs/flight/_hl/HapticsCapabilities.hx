package flight._hl;

abstract HapticsCapabilities(hl.Bytes) {
	public var amplitudeControl(get, set):Bool;

	inline function get_amplitudeControl():Bool return this.getUI8(0) != 0;

	inline function set_amplitudeControl(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var customEvents(get, set):Bool;

	inline function get_customEvents():Bool return this.getUI8(1) != 0;

	inline function set_customEvents(value:Bool):Bool { this.setUI8(1, value ? 1 : 0); return value; }
	public var intensity(get, set):Bool;

	inline function get_intensity():Bool return this.getUI8(2) != 0;

	inline function set_intensity(value:Bool):Bool { this.setUI8(2, value ? 1 : 0); return value; }
	public var patterns(get, set):Bool;

	inline function get_patterns():Bool return this.getUI8(3) != 0;

	inline function set_patterns(value:Bool):Bool { this.setUI8(3, value ? 1 : 0); return value; }
	public var supported(get, set):Bool;

	inline function get_supported():Bool return this.getUI8(4) != 0;

	inline function set_supported(value:Bool):Bool { this.setUI8(4, value ? 1 : 0); return value; }
}

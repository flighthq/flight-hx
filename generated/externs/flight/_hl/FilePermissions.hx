package flight._hl;

abstract FilePermissions(hl.Bytes) {
	public var readable(get, set):Bool;

	inline function get_readable():Bool return this.getUI8(0) != 0;

	inline function set_readable(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var writable(get, set):Bool;

	inline function get_writable():Bool return this.getUI8(1) != 0;

	inline function set_writable(value:Bool):Bool { this.setUI8(1, value ? 1 : 0); return value; }
	public var executable(get, set):Bool;

	inline function get_executable():Bool return this.getUI8(2) != 0;

	inline function set_executable(value:Bool):Bool { this.setUI8(2, value ? 1 : 0); return value; }
}

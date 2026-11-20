package flight._hl;

abstract SocketRuntime(hl.Bytes) {
	public var delivering(get, set):Bool;

	inline function get_delivering():Bool return this.getUI8(44) != 0;

	inline function set_delivering(value:Bool):Bool { this.setUI8(44, value ? 1 : 0); return value; }
	public var disposed(get, set):Bool;

	inline function get_disposed():Bool return this.getUI8(45) != 0;

	inline function set_disposed(value:Bool):Bool { this.setUI8(45, value ? 1 : 0); return value; }
}

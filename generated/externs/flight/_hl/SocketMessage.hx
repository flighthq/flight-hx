package flight._hl;

abstract SocketMessage(hl.Bytes) {
	public var binary(get, set):Bool;

	inline function get_binary():Bool return this.getUI8(24) != 0;

	inline function set_binary(value:Bool):Bool { this.setUI8(24, value ? 1 : 0); return value; }
}

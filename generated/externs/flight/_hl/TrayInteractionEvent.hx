package flight._hl;

abstract TrayInteractionEvent(hl.Bytes) {
	public var altKey(get, set):Bool;

	inline function get_altKey():Bool return this.getUI8(100) != 0;

	inline function set_altKey(value:Bool):Bool { this.setUI8(100, value ? 1 : 0); return value; }
	public var ctrlKey(get, set):Bool;

	inline function get_ctrlKey():Bool return this.getUI8(101) != 0;

	inline function set_ctrlKey(value:Bool):Bool { this.setUI8(101, value ? 1 : 0); return value; }
	public var metaKey(get, set):Bool;

	inline function get_metaKey():Bool return this.getUI8(102) != 0;

	inline function set_metaKey(value:Bool):Bool { this.setUI8(102, value ? 1 : 0); return value; }
	public var shiftKey(get, set):Bool;

	inline function get_shiftKey():Bool return this.getUI8(103) != 0;

	inline function set_shiftKey(value:Bool):Bool { this.setUI8(103, value ? 1 : 0); return value; }
}

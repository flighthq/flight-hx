package flight._hl;

abstract StatusBarInfo(hl.Bytes) {
	public var color(get, set):Int;

	inline function get_color():Int return this.getI32(16);

	inline function set_color(value:Int):Int { this.setI32(16, value); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(20);

	inline function set_height(value:Single):Single { this.setF32(20, value); return value; }
	public var overlaysContent(get, set):Bool;

	inline function get_overlaysContent():Bool return this.getUI8(28) != 0;

	inline function set_overlaysContent(value:Bool):Bool { this.setUI8(28, value ? 1 : 0); return value; }
	public var visible(get, set):Bool;

	inline function get_visible():Bool return this.getUI8(29) != 0;

	inline function set_visible(value:Bool):Bool { this.setUI8(29, value ? 1 : 0); return value; }
}

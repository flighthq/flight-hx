package flight._hl;

abstract AmbientLight(hl.Bytes) {
	public var color(get, set):Int;

	inline function get_color():Int return this.getI32(16);

	inline function set_color(value:Int):Int { this.setI32(16, value); return value; }
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(20) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(20, value ? 1 : 0); return value; }
	public var intensity(get, set):Single;

	inline function get_intensity():Single return this.getF32(24);

	inline function set_intensity(value:Single):Single { this.setF32(24, value); return value; }
}

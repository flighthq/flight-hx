package flight._hl;

abstract FrameTick(hl.Bytes) {
	public var deltaTime(get, set):Float;

	inline function get_deltaTime():Float return this.getF64(0);

	inline function set_deltaTime(value:Float):Float { this.setF64(0, value); return value; }
}

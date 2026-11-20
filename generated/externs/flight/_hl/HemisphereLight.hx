package flight._hl;

abstract HemisphereLight(hl.Bytes) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(16) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(16, value ? 1 : 0); return value; }
	public var groundColor(get, set):Int;

	inline function get_groundColor():Int return this.getI32(20);

	inline function set_groundColor(value:Int):Int { this.setI32(20, value); return value; }
	public var intensity(get, set):Float;

	inline function get_intensity():Float return this.getF64(24);

	inline function set_intensity(value:Float):Float { this.setF64(24, value); return value; }
	public var skyColor(get, set):Int;

	inline function get_skyColor():Int return this.getI32(64);

	inline function set_skyColor(value:Int):Int { this.setI32(64, value); return value; }
}

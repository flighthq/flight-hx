package flight._hl;

abstract AnimationCrossfade(hl.Bytes) {
	public var duration(get, set):Float;

	inline function get_duration():Float return this.getF64(40);

	inline function set_duration(value:Float):Float { this.setF64(40, value); return value; }
	public var elapsed(get, set):Float;

	inline function get_elapsed():Float return this.getF64(48);

	inline function set_elapsed(value:Float):Float { this.setF64(48, value); return value; }
	public var weight(get, set):Single;

	inline function get_weight():Single return this.getF32(120);

	inline function set_weight(value:Single):Single { this.setF32(120, value); return value; }
}

package flight._hl;

abstract AnimationSampleAccumulator(hl.Bytes) {
	public var components(get, set):Int;

	inline function get_components():Int return this.getI32(0);

	inline function set_components(value:Int):Int { this.setI32(0, value); return value; }
	public var quaternion(get, set):Bool;

	inline function get_quaternion():Bool return this.getUI8(8) != 0;

	inline function set_quaternion(value:Bool):Bool { this.setUI8(8, value ? 1 : 0); return value; }
	public var weight(get, set):Single;

	inline function get_weight():Single return this.getF32(40);

	inline function set_weight(value:Single):Single { this.setF32(40, value); return value; }
}

package flight._hl;

abstract AnimationClip(hl.Bytes) {
	public var duration(get, set):Float;

	inline function get_duration():Float return this.getF64(24);

	inline function set_duration(value:Float):Float { this.setF64(24, value); return value; }
}

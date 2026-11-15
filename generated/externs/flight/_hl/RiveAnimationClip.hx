package flight._hl;

abstract RiveAnimationClip(hl.Bytes) {
	public var speed(get, set):Single;

	inline function get_speed():Single return this.getF32(104);

	inline function set_speed(value:Single):Single { this.setF32(104, value); return value; }
}

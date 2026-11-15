package flight._hl;

abstract RiveStateMachineTransition(hl.Bytes) {
	public var duration(get, set):Single;

	inline function get_duration():Single return this.getF32(0);

	inline function set_duration(value:Single):Single { this.setF32(0, value); return value; }
	public var exitTime(get, set):Single;

	inline function get_exitTime():Single return this.getF32(4);

	inline function set_exitTime(value:Single):Single { this.setF32(4, value); return value; }
	public var flags(get, set):Single;

	inline function get_flags():Single return this.getF32(8);

	inline function set_flags(value:Single):Single { this.setF32(8, value); return value; }
	public var toStateId(get, set):Single;

	inline function get_toStateId():Single return this.getF32(12);

	inline function set_toStateId(value:Single):Single { this.setF32(12, value); return value; }
}

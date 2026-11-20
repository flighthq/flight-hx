package flight._hl;

abstract RiveStateMachineTransition(hl.Bytes) {
	public var duration(get, set):Float;

	inline function get_duration():Float return this.getF64(0);

	inline function set_duration(value:Float):Float { this.setF64(0, value); return value; }
	public var exitTime(get, set):Float;

	inline function get_exitTime():Float return this.getF64(8);

	inline function set_exitTime(value:Float):Float { this.setF64(8, value); return value; }
	public var flags(get, set):Float;

	inline function get_flags():Float return this.getF64(16);

	inline function set_flags(value:Float):Float { this.setF64(16, value); return value; }
	public var toStateId(get, set):Float;

	inline function get_toStateId():Float return this.getF64(24);

	inline function set_toStateId(value:Float):Float { this.setF64(24, value); return value; }
}

package flight._hl;

abstract SignalTimerState(hl.Bytes) {
	public var nowMs(get, set):Float;

	inline function get_nowMs():Float return this.getF64(0);

	inline function set_nowMs(value:Float):Float { this.setF64(0, value); return value; }
	public var nextId(get, set):haxe.Int64;

	inline function get_nextId():haxe.Int64 return haxe.Int64.make(this.getI32(36), this.getI32(32));

	inline function set_nextId(value:haxe.Int64):haxe.Int64 { { this.setI32(32, value.low); this.setI32(36, value.high); }; return value; }
}

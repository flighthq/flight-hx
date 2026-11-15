package flight._hl;

abstract FlowGuardState(hl.Bytes) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(0) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var transitionDepth(get, set):Int;

	inline function get_transitionDepth():Int return this.getI32(4);

	inline function set_transitionDepth(value:Int):Int { this.setI32(4, value); return value; }
}

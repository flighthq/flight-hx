package flight._hl;

abstract TimerId(hl.Bytes) {
	public var value(get, set):haxe.Int64;

	inline function get_value():haxe.Int64 return haxe.Int64.make(this.getI32(4), this.getI32(0));

	inline function set_value(value:haxe.Int64):haxe.Int64 { { this.setI32(0, value.low); this.setI32(4, value.high); }; return value; }
}

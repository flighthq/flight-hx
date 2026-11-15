package flight._hl;

abstract RiveCoreObject(hl.Bytes) {
	public var typeKey(get, set):haxe.Int64;

	inline function get_typeKey():haxe.Int64 return haxe.Int64.make(this.getI32(28), this.getI32(24));

	inline function set_typeKey(value:haxe.Int64):haxe.Int64 { { this.setI32(24, value.low); this.setI32(28, value.high); }; return value; }
}

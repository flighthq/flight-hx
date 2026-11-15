package flight._hl;

abstract RiveDocumentHeader(hl.Bytes) {
	public var fileId(get, set):haxe.Int64;

	inline function get_fileId():haxe.Int64 return haxe.Int64.make(this.getI32(4), this.getI32(0));

	inline function set_fileId(value:haxe.Int64):haxe.Int64 { { this.setI32(0, value.low); this.setI32(4, value.high); }; return value; }
	public var majorVersion(get, set):haxe.Int64;

	inline function get_majorVersion():haxe.Int64 return haxe.Int64.make(this.getI32(12), this.getI32(8));

	inline function set_majorVersion(value:haxe.Int64):haxe.Int64 { { this.setI32(8, value.low); this.setI32(12, value.high); }; return value; }
	public var minorVersion(get, set):haxe.Int64;

	inline function get_minorVersion():haxe.Int64 return haxe.Int64.make(this.getI32(20), this.getI32(16));

	inline function set_minorVersion(value:haxe.Int64):haxe.Int64 { { this.setI32(16, value.low); this.setI32(20, value.high); }; return value; }
}

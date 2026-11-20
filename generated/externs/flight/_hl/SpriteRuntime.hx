package flight._hl;

abstract SpriteRuntime(hl.Bytes) {
	public var localBoundsTextureVersion(get, set):haxe.Int64;

	inline function get_localBoundsTextureVersion():haxe.Int64 return haxe.Int64.make(this.getI32(12), this.getI32(8));

	inline function set_localBoundsTextureVersion(value:haxe.Int64):haxe.Int64 { { this.setI32(8, value.low); this.setI32(12, value.high); }; return value; }
}

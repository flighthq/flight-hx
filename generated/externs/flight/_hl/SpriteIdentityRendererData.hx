package flight._hl;

abstract SpriteIdentityRendererData(hl.Bytes) {
	public var textureVersion(get, set):haxe.Int64;

	inline function get_textureVersion():haxe.Int64 return haxe.Int64.make(this.getI32(28), this.getI32(24));

	inline function set_textureVersion(value:haxe.Int64):haxe.Int64 { { this.setI32(24, value.low); this.setI32(28, value.high); }; return value; }
}

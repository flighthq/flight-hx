package flight._hl;

abstract CocosPlistFrame(hl.Bytes) {
	public var spriteTrimmed(get, set):Bool;

	inline function get_spriteTrimmed():Bool return this.getUI8(120) != 0;

	inline function set_spriteTrimmed(value:Bool):Bool { this.setUI8(120, value ? 1 : 0); return value; }
	public var textureRotated(get, set):Bool;

	inline function get_textureRotated():Bool return this.getUI8(121) != 0;

	inline function set_textureRotated(value:Bool):Bool { this.setUI8(121, value ? 1 : 0); return value; }
}

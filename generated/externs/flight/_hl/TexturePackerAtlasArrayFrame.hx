package flight._hl;

abstract TexturePackerAtlasArrayFrame(hl.Bytes) {
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return this.getUI8(52) != 0;

	inline function set_rotated(value:Bool):Bool { this.setUI8(52, value ? 1 : 0); return value; }
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return this.getUI8(80) != 0;

	inline function set_trimmed(value:Bool):Bool { this.setUI8(80, value ? 1 : 0); return value; }
}

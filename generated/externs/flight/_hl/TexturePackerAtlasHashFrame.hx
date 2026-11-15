package flight._hl;

abstract TexturePackerAtlasHashFrame(hl.Bytes) {
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return this.getUI8(28) != 0;

	inline function set_rotated(value:Bool):Bool { this.setUI8(28, value ? 1 : 0); return value; }
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return this.getUI8(56) != 0;

	inline function set_trimmed(value:Bool):Bool { this.setUI8(56, value ? 1 : 0); return value; }
}

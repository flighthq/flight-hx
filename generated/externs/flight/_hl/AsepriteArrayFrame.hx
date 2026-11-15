package flight._hl;

abstract AsepriteArrayFrame(hl.Bytes) {
	public var duration(get, set):Single;

	inline function get_duration():Single return this.getF32(0);

	inline function set_duration(value:Single):Single { this.setF32(0, value); return value; }
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return this.getUI8(48) != 0;

	inline function set_rotated(value:Bool):Bool { this.setUI8(48, value ? 1 : 0); return value; }
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return this.getUI8(76) != 0;

	inline function set_trimmed(value:Bool):Bool { this.setUI8(76, value ? 1 : 0); return value; }
}

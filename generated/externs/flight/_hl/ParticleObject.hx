package flight._hl;

abstract ParticleObject(hl.Bytes) {
	public var alpha(get, set):Single;

	inline function get_alpha():Single return this.getF32(0);

	inline function set_alpha(value:Single):Single { this.setF32(0, value); return value; }
	public var rotation(get, set):Single;

	inline function get_rotation():Single return this.getF32(32);

	inline function set_rotation(value:Single):Single { this.setF32(32, value); return value; }
	public var scaleX(get, set):Single;

	inline function get_scaleX():Single return this.getF32(36);

	inline function set_scaleX(value:Single):Single { this.setF32(36, value); return value; }
	public var scaleY(get, set):Single;

	inline function get_scaleY():Single return this.getF32(40);

	inline function set_scaleY(value:Single):Single { this.setF32(40, value); return value; }
	public var visible(get, set):Bool;

	inline function get_visible():Bool return this.getUI8(44) != 0;

	inline function set_visible(value:Bool):Bool { this.setUI8(44, value ? 1 : 0); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(48);

	inline function set_x(value:Single):Single { this.setF32(48, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(52);

	inline function set_y(value:Single):Single { this.setF32(52, value); return value; }
}

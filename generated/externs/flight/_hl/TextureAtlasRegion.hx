package flight._hl;

abstract TextureAtlasRegion(hl.Bytes) {
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(16);

	inline function set_height(value:Single):Single { this.setF32(16, value); return value; }
	public var id(get, set):Int;

	inline function get_id():Int return this.getI32(20);

	inline function set_id(value:Int):Int { this.setI32(20, value); return value; }
	public var sourceX(get, set):Single;

	inline function get_sourceX():Single return this.getF32(108);

	inline function set_sourceX(value:Single):Single { this.setF32(108, value); return value; }
	public var sourceY(get, set):Single;

	inline function get_sourceY():Single return this.getF32(112);

	inline function set_sourceY(value:Single):Single { this.setF32(112, value); return value; }
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return this.getUI8(116) != 0;

	inline function set_trimmed(value:Bool):Bool { this.setUI8(116, value ? 1 : 0); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(120);

	inline function set_x(value:Single):Single { this.setF32(120, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(124);

	inline function set_y(value:Single):Single { this.setF32(124, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(128);

	inline function set_width(value:Single):Single { this.setF32(128, value); return value; }
}

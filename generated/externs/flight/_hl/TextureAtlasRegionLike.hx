package flight._hl;

abstract TextureAtlasRegionLike(hl.Bytes) {
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(0);

	inline function set_height(value:Single):Single { this.setF32(0, value); return value; }
	public var id(get, set):Int;

	inline function get_id():Int return this.getI32(4);

	inline function set_id(value:Int):Int { this.setI32(4, value); return value; }
	public var sourceX(get, set):Single;

	inline function get_sourceX():Single return this.getF32(92);

	inline function set_sourceX(value:Single):Single { this.setF32(92, value); return value; }
	public var sourceY(get, set):Single;

	inline function get_sourceY():Single return this.getF32(96);

	inline function set_sourceY(value:Single):Single { this.setF32(96, value); return value; }
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return this.getUI8(100) != 0;

	inline function set_trimmed(value:Bool):Bool { this.setUI8(100, value ? 1 : 0); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(104);

	inline function set_x(value:Single):Single { this.setF32(104, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(108);

	inline function set_y(value:Single):Single { this.setF32(108, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(112);

	inline function set_width(value:Single):Single { this.setF32(112, value); return value; }
}

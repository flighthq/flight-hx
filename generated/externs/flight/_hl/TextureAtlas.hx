package flight._hl;

abstract TextureAtlas(hl.Bytes) {
	public var imageHeight(get, set):Single;

	inline function get_imageHeight():Single return this.getF32(16);

	inline function set_imageHeight(value:Single):Single { this.setF32(16, value); return value; }
	public var imageWidth(get, set):Single;

	inline function get_imageWidth():Single return this.getF32(48);

	inline function set_imageWidth(value:Single):Single { this.setF32(48, value); return value; }
	public var scale(get, set):Single;

	inline function get_scale():Single return this.getF32(80);

	inline function set_scale(value:Single):Single { this.setF32(80, value); return value; }
}

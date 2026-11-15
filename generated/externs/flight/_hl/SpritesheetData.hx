package flight._hl;

abstract SpritesheetData(hl.Bytes) {
	public var imageHeight(get, set):Single;

	inline function get_imageHeight():Single return this.getF32(88);

	inline function set_imageHeight(value:Single):Single { this.setF32(88, value); return value; }
	public var imageWidth(get, set):Single;

	inline function get_imageWidth():Single return this.getF32(92);

	inline function set_imageWidth(value:Single):Single { this.setF32(92, value); return value; }
	public var scale(get, set):Single;

	inline function get_scale():Single return this.getF32(96);

	inline function set_scale(value:Single):Single { this.setF32(96, value); return value; }
}

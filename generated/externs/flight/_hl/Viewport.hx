package flight._hl;

abstract Viewport(hl.Bytes) {
	public var devicePixelRatio(get, set):Single;

	inline function get_devicePixelRatio():Single return this.getF32(16);

	inline function set_devicePixelRatio(value:Single):Single { this.setF32(16, value); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(20);

	inline function set_height(value:Single):Single { this.setF32(20, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(24);

	inline function set_width(value:Single):Single { this.setF32(24, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(28);

	inline function set_x(value:Single):Single { this.setF32(28, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(32);

	inline function set_y(value:Single):Single { this.setF32(32, value); return value; }

	static inline public function create():flight._hl.Viewport {
		return flight._hl._fn.Node.createViewport();
	}
	inline public function getAspect():Single {
		return flight._hl._fn.Node.getViewportAspect(cast this);
	}
	inline public function free():Void {
		flight._hl._fn.Node.freeViewport(cast this);
	}
}

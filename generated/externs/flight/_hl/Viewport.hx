package flight._hl;

abstract Viewport(hl.Bytes) {
	public var devicePixelRatio(get, set):Float;

	inline function get_devicePixelRatio():Float return this.getF64(16);

	inline function set_devicePixelRatio(value:Float):Float { this.setF64(16, value); return value; }
	public var height(get, set):Float;

	inline function get_height():Float return this.getF64(24);

	inline function set_height(value:Float):Float { this.setF64(24, value); return value; }
	public var width(get, set):Float;

	inline function get_width():Float return this.getF64(32);

	inline function set_width(value:Float):Float { this.setF64(32, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(40);

	inline function set_x(value:Float):Float { this.setF64(40, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(48);

	inline function set_y(value:Float):Float { this.setF64(48, value); return value; }

	static inline public function create():flight._hl.Viewport {
		return flight._hl._fn.Node.createViewport();
	}
	inline public function getAspect():Float {
		return flight._hl._fn.Node.getViewportAspect(cast this);
	}
	inline public function free():Void {
		flight._hl._fn.Node.freeViewport(cast this);
	}
}

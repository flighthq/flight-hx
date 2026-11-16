package flight._hl;

abstract Scene2D(hl.Bytes) {
	public var scene2dHeight(get, set):Float;

	inline function get_scene2dHeight():Float return this.getF64(72);

	inline function set_scene2dHeight(value:Float):Float { this.setF64(72, value); return value; }
	public var scene2dWidth(get, set):Float;

	inline function get_scene2dWidth():Float return this.getF64(80);

	inline function set_scene2dWidth(value:Float):Float { this.setF64(80, value); return value; }

	inline public function enableSignals():hl.Bytes {
		return flight._hl._fn.Scene2d.enableScene2dSignals(cast this);
	}
	inline public function getRuntime():flight._hl.Scene2DRuntime {
		return flight._hl._fn.Scene2d.getScene2dRuntime(cast this);
	}
	inline public function getSignals():hl.Bytes {
		return flight._hl._fn.Scene2d.getScene2dSignals(cast this);
	}
	inline public function getKindUsage(out:flight._hl.Scene2DKindUsage):Void {
		flight._hl._fn.Scene2d.getScene2dKindUsage(out, cast this);
	}
}

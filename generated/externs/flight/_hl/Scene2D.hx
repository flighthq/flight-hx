package flight._hl;

private extern class Scene2D_Ffi {
	@:hlNative("flight", "flight_get_scene2_d_scene2d_height")
	static function get_scene2dHeight(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_scene2_d_scene2d_height")
	static function set_scene2dHeight(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_scene2_d_scene2d_width")
	static function get_scene2dWidth(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_scene2_d_scene2d_width")
	static function set_scene2dWidth(ptr:hl.Bytes, value:Float):Float;
}

abstract Scene2D(hl.Bytes) {
	public var scene2dHeight(get, set):Float;

	inline function get_scene2dHeight():Float return Scene2D_Ffi.get_scene2dHeight(this);

	inline function set_scene2dHeight(value:Float):Float { Scene2D_Ffi.set_scene2dHeight(this, value); return value; }
	public var scene2dWidth(get, set):Float;

	inline function get_scene2dWidth():Float return Scene2D_Ffi.get_scene2dWidth(this);

	inline function set_scene2dWidth(value:Float):Float { Scene2D_Ffi.set_scene2dWidth(this, value); return value; }

	inline public function enableSignals():hl.Bytes {
		return flight._hl._fn.Scene2D.enableScene2dSignals(cast this);
	}
	inline public function getSignals():hl.Bytes {
		return flight._hl._fn.Scene2D.getScene2dSignals(cast this);
	}
	inline public function getKindUsage(out:flight._hl.Scene2DKindUsage):Void {
		flight._hl._fn.Scene2D.getScene2dKindUsage(out, cast this);
	}
}

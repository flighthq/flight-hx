package flight._js;

@:jsRequire("flight")
private extern class Scene2D_Ffi {
	@:native("flight_get_scene2_d_scene2d_height") static function get_scene2dHeight(ptr:Dynamic):Float;
	@:native("flight_set_scene2_d_scene2d_height") static function set_scene2dHeight(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_scene2_d_scene2d_width") static function get_scene2dWidth(ptr:Dynamic):Float;
	@:native("flight_set_scene2_d_scene2d_width") static function set_scene2dWidth(ptr:Dynamic, value:Float):Float;
}

abstract Scene2D(Dynamic) {
	public var scene2dHeight(get, set):Float;

	inline function get_scene2dHeight():Float return Scene2D_Ffi.get_scene2dHeight(this);

	inline function set_scene2dHeight(value:Float):Float return Scene2D_Ffi.set_scene2dHeight(this, value);
	public var scene2dWidth(get, set):Float;

	inline function get_scene2dWidth():Float return Scene2D_Ffi.get_scene2dWidth(this);

	inline function set_scene2dWidth(value:Float):Float return Scene2D_Ffi.set_scene2dWidth(this, value);

	inline public function enableSignals():Dynamic {
		return flight._js._fn.Scene2d.enableScene2dSignals(cast this);
	}
	inline public function getRuntime():flight._js.Scene2DRuntime {
		return flight._js._fn.Scene2d.getScene2dRuntime(cast this);
	}
	inline public function getSignals():Dynamic {
		return flight._js._fn.Scene2d.getScene2dSignals(cast this);
	}
	inline public function getKindUsage(out:flight._js.Scene2DKindUsage):Void {
		flight._js._fn.Scene2d.getScene2dKindUsage(out, cast this);
	}
}

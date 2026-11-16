package flight._js;

abstract Scene2D(Dynamic) {
	public var scene2dHeight(get, set):Float;
	inline function get_scene2dHeight():Float return untyped this.scene2DHeight;
	inline function set_scene2dHeight(value:Float):Float return untyped this.scene2DHeight = value;
	public var scene2dWidth(get, set):Float;
	inline function get_scene2dWidth():Float return untyped this.scene2DWidth;
	inline function set_scene2dWidth(value:Float):Float return untyped this.scene2DWidth = value;
	inline public function enableSignals():Dynamic {
		return flight._js._fn.Scene2d.enableScene2dSignals(cast this);
	}
	inline public function getRuntime():flight._js.Scene2DRuntime {
		return flight._js._fn.Scene2d.getScene2dRuntime(cast this);
	}
	inline public function getSignals():Null<Dynamic> {
		return flight._js._fn.Scene2d.getScene2dSignals(cast this);
	}
	inline public function getKindUsage(out:flight._js.Scene2DKindUsage):Void {
		flight._js._fn.Scene2d.getScene2dKindUsage(out, cast this);
	}
}

package flight._js;

abstract Scene2D(Dynamic) {
	public var scene2dHeight(get, set):Float;
	inline function get_scene2dHeight():Float return untyped this.scene2DHeight;
	inline function set_scene2dHeight(value:Float):Float return untyped this.scene2DHeight = value;
	public var scene2dWidth(get, set):Float;
	inline function get_scene2dWidth():Float return untyped this.scene2DWidth;
	inline function set_scene2dWidth(value:Float):Float return untyped this.scene2DWidth = value;
	inline public function enableSignals():Dynamic {
		return flight._js._fn.Scene2D.enableScene2dSignals(cast this);
	}
	inline public function getSignals():Null<Dynamic> {
		return flight._js._fn.Scene2D.getScene2dSignals(cast this);
	}
	inline public function getKindUsage(out:flight._js.Scene2DKindUsage):Void {
		flight._js._fn.Scene2D.getScene2dKindUsage(out, cast this);
	}
}

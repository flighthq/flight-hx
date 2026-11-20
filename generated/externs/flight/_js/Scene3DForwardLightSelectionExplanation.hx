package flight._js;

abstract Scene3DForwardLightSelectionExplanation(Dynamic) {
	public var pointLightCount(get, set):Int;
	inline function get_pointLightCount():Int return untyped this.pointLightCount;
	inline function set_pointLightCount(value:Int):Int return untyped this.pointLightCount = value;
	public var selectionPrepared(get, set):Bool;
	inline function get_selectionPrepared():Bool return untyped this.selectionPrepared;
	inline function set_selectionPrepared(value:Bool):Bool return untyped this.selectionPrepared = value;
	public var spotLightCount(get, set):Int;
	inline function get_spotLightCount():Int return untyped this.spotLightCount;
	inline function set_spotLightCount(value:Int):Int return untyped this.spotLightCount = value;
}

package flight._js;

abstract InteractionPointerState(Dynamic) {
	public var lastClickTime(get, set):Float;
	inline function get_lastClickTime():Float return untyped this.lastClickTime;
	inline function set_lastClickTime(value:Float):Float return untyped this.lastClickTime = value;
	public var lastPointerClickButton(get, set):Int;
	inline function get_lastPointerClickButton():Int return untyped this.lastPointerClickButton;
	inline function set_lastPointerClickButton(value:Int):Int return untyped this.lastPointerClickButton = value;
	public var lastPointerClickTime(get, set):Float;
	inline function get_lastPointerClickTime():Float return untyped this.lastPointerClickTime;
	inline function set_lastPointerClickTime(value:Float):Float return untyped this.lastPointerClickTime = value;
	public var lastPointerClickX(get, set):Float;
	inline function get_lastPointerClickX():Float return untyped this.lastPointerClickX;
	inline function set_lastPointerClickX(value:Float):Float return untyped this.lastPointerClickX = value;
	public var lastPointerClickY(get, set):Float;
	inline function get_lastPointerClickY():Float return untyped this.lastPointerClickY;
	inline function set_lastPointerClickY(value:Float):Float return untyped this.lastPointerClickY = value;
}

package flight._js;

abstract InputGamepadButtonData(Dynamic) {
	public var button(get, set):Int;
	inline function get_button():Int return untyped this.button;
	inline function set_button(value:Int):Int return untyped this.button = value;
	public var gamepad(get, set):Int;
	inline function get_gamepad():Int return untyped this.gamepad;
	inline function set_gamepad(value:Int):Int return untyped this.gamepad = value;
	public var timeStamp(get, set):Float;
	inline function get_timeStamp():Float return untyped this.timeStamp;
	inline function set_timeStamp(value:Float):Float return untyped this.timeStamp = value;
	public var value(get, set):Float;
	inline function get_value():Float return untyped this.value;
	inline function set_value(value:Float):Float return untyped this.value = value;
}

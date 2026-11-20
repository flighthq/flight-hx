package flight._js;

abstract InputGamepadConnectData(Dynamic) {
	public var gamepad(get, set):Int;
	inline function get_gamepad():Int return untyped this.gamepad;
	inline function set_gamepad(value:Int):Int return untyped this.gamepad = value;
	public var id(get, set):String;
	inline function get_id():String return untyped this.id;
	inline function set_id(value:String):String return untyped this.id = value;
}

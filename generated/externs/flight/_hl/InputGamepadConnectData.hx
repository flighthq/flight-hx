package flight._hl;

abstract InputGamepadConnectData(hl.Bytes) {
	public var gamepad(get, set):Int;

	inline function get_gamepad():Int return this.getI32(0);

	inline function set_gamepad(value:Int):Int { this.setI32(0, value); return value; }
}

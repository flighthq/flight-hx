package flight._hl;

abstract InteractionPointerState(hl.Bytes) {
	public var lastClickTime(get, set):Float;

	inline function get_lastClickTime():Float return this.getF64(64);

	inline function set_lastClickTime(value:Float):Float { this.setF64(64, value); return value; }
	public var lastPointerClickButton(get, set):Int;

	inline function get_lastPointerClickButton():Int return this.getI32(104);

	inline function set_lastPointerClickButton(value:Int):Int { this.setI32(104, value); return value; }
	public var lastPointerClickTime(get, set):Float;

	inline function get_lastPointerClickTime():Float return this.getF64(80);

	inline function set_lastPointerClickTime(value:Float):Float { this.setF64(80, value); return value; }
	public var lastPointerClickX(get, set):Float;

	inline function get_lastPointerClickX():Float return this.getF64(88);

	inline function set_lastPointerClickX(value:Float):Float { this.setF64(88, value); return value; }
	public var lastPointerClickY(get, set):Float;

	inline function get_lastPointerClickY():Float return this.getF64(96);

	inline function set_lastPointerClickY(value:Float):Float { this.setF64(96, value); return value; }
}

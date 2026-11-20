package flight._hl;

abstract PointerEventData(hl.Bytes) {
	public var altKey(get, set):Bool;

	inline function get_altKey():Bool return this.getUI8(112) != 0;

	inline function set_altKey(value:Bool):Bool { this.setUI8(112, value ? 1 : 0); return value; }
	public var button(get, set):Int;

	inline function get_button():Int return this.getI32(96);

	inline function set_button(value:Int):Int { this.setI32(96, value); return value; }
	public var buttons(get, set):Int;

	inline function get_buttons():Int return this.getI32(100);

	inline function set_buttons(value:Int):Int { this.setI32(100, value); return value; }
	public var ctrlKey(get, set):Bool;

	inline function get_ctrlKey():Bool return this.getUI8(113) != 0;

	inline function set_ctrlKey(value:Bool):Bool { this.setUI8(113, value ? 1 : 0); return value; }
	public var deltaX(get, set):Float;

	inline function get_deltaX():Float return this.getF64(32);

	inline function set_deltaX(value:Float):Float { this.setF64(32, value); return value; }
	public var deltaY(get, set):Float;

	inline function get_deltaY():Float return this.getF64(40);

	inline function set_deltaY(value:Float):Float { this.setF64(40, value); return value; }
	public var localX(get, set):Float;

	inline function get_localX():Float return this.getF64(48);

	inline function set_localX(value:Float):Float { this.setF64(48, value); return value; }
	public var localY(get, set):Float;

	inline function get_localY():Float return this.getF64(56);

	inline function set_localY(value:Float):Float { this.setF64(56, value); return value; }
	public var metaKey(get, set):Bool;

	inline function get_metaKey():Bool return this.getUI8(114) != 0;

	inline function set_metaKey(value:Bool):Bool { this.setUI8(114, value ? 1 : 0); return value; }
	public var pointerId(get, set):Int;

	inline function get_pointerId():Int return this.getI32(104);

	inline function set_pointerId(value:Int):Int { this.setI32(104, value); return value; }
	public var shiftKey(get, set):Bool;

	inline function get_shiftKey():Bool return this.getUI8(115) != 0;

	inline function set_shiftKey(value:Bool):Bool { this.setUI8(115, value ? 1 : 0); return value; }
	public var worldX(get, set):Float;

	inline function get_worldX():Float return this.getF64(64);

	inline function set_worldX(value:Float):Float { this.setF64(64, value); return value; }
	public var worldY(get, set):Float;

	inline function get_worldY():Float return this.getF64(72);

	inline function set_worldY(value:Float):Float { this.setF64(72, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(80);

	inline function set_x(value:Float):Float { this.setF64(80, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(88);

	inline function set_y(value:Float):Float { this.setF64(88, value); return value; }
}

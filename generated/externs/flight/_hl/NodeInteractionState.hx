package flight._hl;

abstract NodeInteractionState(hl.Bytes) {
	public var childrenHitTestEnabled(get, set):Bool;

	inline function get_childrenHitTestEnabled():Bool return this.getUI8(84) != 0;

	inline function set_childrenHitTestEnabled(value:Bool):Bool { this.setUI8(84, value ? 1 : 0); return value; }
	public var focusable(get, set):Bool;

	inline function get_focusable():Bool return this.getUI8(85) != 0;

	inline function set_focusable(value:Bool):Bool { this.setUI8(85, value ? 1 : 0); return value; }
	public var hitTestEnabled(get, set):Bool;

	inline function get_hitTestEnabled():Bool return this.getUI8(86) != 0;

	inline function set_hitTestEnabled(value:Bool):Bool { this.setUI8(86, value ? 1 : 0); return value; }
	public var pointerDoubleClickEnabled(get, set):Bool;

	inline function get_pointerDoubleClickEnabled():Bool return this.getUI8(87) != 0;

	inline function set_pointerDoubleClickEnabled(value:Bool):Bool { this.setUI8(87, value ? 1 : 0); return value; }
	public var tabIndex(get, set):Int;

	inline function get_tabIndex():Int return this.getI32(80);

	inline function set_tabIndex(value:Int):Int { this.setI32(80, value); return value; }
}

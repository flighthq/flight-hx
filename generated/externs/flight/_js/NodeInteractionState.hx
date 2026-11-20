package flight._js;

abstract NodeInteractionState(Dynamic) {
	public var childrenHitTestEnabled(get, set):Bool;
	inline function get_childrenHitTestEnabled():Bool return untyped this.childrenHitTestEnabled;
	inline function set_childrenHitTestEnabled(value:Bool):Bool return untyped this.childrenHitTestEnabled = value;
	public var focusable(get, set):Bool;
	inline function get_focusable():Bool return untyped this.focusable;
	inline function set_focusable(value:Bool):Bool return untyped this.focusable = value;
	public var hitTestEnabled(get, set):Bool;
	inline function get_hitTestEnabled():Bool return untyped this.hitTestEnabled;
	inline function set_hitTestEnabled(value:Bool):Bool return untyped this.hitTestEnabled = value;
	public var pointerDoubleClickEnabled(get, set):Bool;
	inline function get_pointerDoubleClickEnabled():Bool return untyped this.pointerDoubleClickEnabled;
	inline function set_pointerDoubleClickEnabled(value:Bool):Bool return untyped this.pointerDoubleClickEnabled = value;
	public var tabIndex(get, set):Int;
	inline function get_tabIndex():Int return untyped this.tabIndex;
	inline function set_tabIndex(value:Int):Int return untyped this.tabIndex = value;
}

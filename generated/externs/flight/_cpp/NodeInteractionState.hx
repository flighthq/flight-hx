package flight._cpp;

private extern class NodeInteractionState_Ffi {
	@:native("flight_get_node_interaction_state_children_hit_test_enabled") static function get_childrenHitTestEnabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_node_interaction_state_children_hit_test_enabled") static function set_childrenHitTestEnabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_node_interaction_state_focusable") static function get_focusable(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_node_interaction_state_focusable") static function set_focusable(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_node_interaction_state_hit_test_enabled") static function get_hitTestEnabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_node_interaction_state_hit_test_enabled") static function set_hitTestEnabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_node_interaction_state_pointer_double_click_enabled") static function get_pointerDoubleClickEnabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_node_interaction_state_pointer_double_click_enabled") static function set_pointerDoubleClickEnabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_node_interaction_state_tab_index") static function get_tabIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_node_interaction_state_tab_index") static function set_tabIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract NodeInteractionState(cpp.Star<cpp.Void>) {
	public var childrenHitTestEnabled(get, set):Bool;

	inline function get_childrenHitTestEnabled():Bool return NodeInteractionState_Ffi.get_childrenHitTestEnabled(this);

	inline function set_childrenHitTestEnabled(value:Bool):Bool { NodeInteractionState_Ffi.set_childrenHitTestEnabled(this, value); return value; }
	public var focusable(get, set):Bool;

	inline function get_focusable():Bool return NodeInteractionState_Ffi.get_focusable(this);

	inline function set_focusable(value:Bool):Bool { NodeInteractionState_Ffi.set_focusable(this, value); return value; }
	public var hitTestEnabled(get, set):Bool;

	inline function get_hitTestEnabled():Bool return NodeInteractionState_Ffi.get_hitTestEnabled(this);

	inline function set_hitTestEnabled(value:Bool):Bool { NodeInteractionState_Ffi.set_hitTestEnabled(this, value); return value; }
	public var pointerDoubleClickEnabled(get, set):Bool;

	inline function get_pointerDoubleClickEnabled():Bool return NodeInteractionState_Ffi.get_pointerDoubleClickEnabled(this);

	inline function set_pointerDoubleClickEnabled(value:Bool):Bool { NodeInteractionState_Ffi.set_pointerDoubleClickEnabled(this, value); return value; }
	public var tabIndex(get, set):Int;

	inline function get_tabIndex():Int return NodeInteractionState_Ffi.get_tabIndex(this);

	inline function set_tabIndex(value:Int):Int { NodeInteractionState_Ffi.set_tabIndex(this, value); return value; }
}

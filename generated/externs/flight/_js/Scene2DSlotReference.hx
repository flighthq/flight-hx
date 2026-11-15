package flight._js;

@:jsRequire("flight")
private extern class Scene2DSlotReference_Ffi {
	@:native("flight_get_scene2_dslot_reference_required") static function get_required(ptr:Dynamic):Bool;
	@:native("flight_set_scene2_dslot_reference_required") static function set_required(ptr:Dynamic, value:Bool):Bool;
}

abstract Scene2DSlotReference(Dynamic) {
	public var required(get, set):Bool;

	inline function get_required():Bool return Scene2DSlotReference_Ffi.get_required(this);

	inline function set_required(value:Bool):Bool return Scene2DSlotReference_Ffi.set_required(this, value);
}

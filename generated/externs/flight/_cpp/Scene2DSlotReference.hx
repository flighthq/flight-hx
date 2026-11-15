package flight._cpp;

private extern class Scene2DSlotReference_Ffi {
	@:native("flight_get_scene2_dslot_reference_required") static function get_required(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_scene2_dslot_reference_required") static function set_required(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Scene2DSlotReference(cpp.Star<cpp.Void>) {
	public var required(get, set):Bool;

	inline function get_required():Bool return Scene2DSlotReference_Ffi.get_required(this);

	inline function set_required(value:Bool):Bool return Scene2DSlotReference_Ffi.set_required(this, value);
}

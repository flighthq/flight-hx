package flight._cpp;

private extern class Scene2DSlotReference_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_scene2_dslot_reference_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_scene2_dslot_reference_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_scene2_dslot_reference_required") static function get_required(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_scene2_dslot_reference_required") static function set_required(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Scene2DSlotReference(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String { var raw = Scene2DSlotReference_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Scene2DSlotReference_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; Scene2DSlotReference_Ffi.set_name(this, raw); return value; }
	public var required(get, set):Bool;

	inline function get_required():Bool return Scene2DSlotReference_Ffi.get_required(this);

	inline function set_required(value:Bool):Bool { Scene2DSlotReference_Ffi.set_required(this, value); return value; }
}

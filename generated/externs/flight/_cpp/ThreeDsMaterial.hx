package flight._cpp;

private extern class ThreeDsMaterial_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_three_ds_material_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_three_ds_material_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_three_ds_material_opacity") static function get_opacity(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_three_ds_material_opacity") static function set_opacity(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract ThreeDsMaterial(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String { var raw = ThreeDsMaterial_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ThreeDsMaterial_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; ThreeDsMaterial_Ffi.set_name(this, raw); return value; }
	public var opacity(get, set):Float;

	inline function get_opacity():Float return ThreeDsMaterial_Ffi.get_opacity(this);

	inline function set_opacity(value:Float):Float { ThreeDsMaterial_Ffi.set_opacity(this, value); return value; }
}

package flight._cpp;

private extern class AsepriteLayer_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_aseprite_layer_blend_mode") static function get_blendMode(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_aseprite_layer_blend_mode") static function set_blendMode(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_aseprite_layer_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_aseprite_layer_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_aseprite_layer_opacity") static function get_opacity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_aseprite_layer_opacity") static function set_opacity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract AsepriteLayer(cpp.Star<cpp.Void>) {
	public var blendMode(get, set):String;
	inline function get_blendMode():String { var raw = AsepriteLayer_Ffi.get_blendMode(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AsepriteLayer_Ffi.freeString(raw); return value; }
	inline function set_blendMode(value:String):String { var raw:cpp.ConstCharStar = cast value; AsepriteLayer_Ffi.set_blendMode(this, raw); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = AsepriteLayer_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AsepriteLayer_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; AsepriteLayer_Ffi.set_name(this, raw); return value; }
	public var opacity(get, set):Single;

	inline function get_opacity():Single return AsepriteLayer_Ffi.get_opacity(this);

	inline function set_opacity(value:Single):Single { AsepriteLayer_Ffi.set_opacity(this, value); return value; }
}

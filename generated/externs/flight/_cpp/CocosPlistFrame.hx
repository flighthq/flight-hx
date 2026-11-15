package flight._cpp;

private extern class CocosPlistFrame_Ffi {
	@:native("flight_get_cocos_plist_frame_sprite_trimmed") static function get_spriteTrimmed(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_cocos_plist_frame_sprite_trimmed") static function set_spriteTrimmed(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_cocos_plist_frame_texture_rotated") static function get_textureRotated(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_cocos_plist_frame_texture_rotated") static function set_textureRotated(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract CocosPlistFrame(cpp.Star<cpp.Void>) {
	public var spriteTrimmed(get, set):Bool;

	inline function get_spriteTrimmed():Bool return CocosPlistFrame_Ffi.get_spriteTrimmed(this);

	inline function set_spriteTrimmed(value:Bool):Bool return CocosPlistFrame_Ffi.set_spriteTrimmed(this, value);
	public var textureRotated(get, set):Bool;

	inline function get_textureRotated():Bool return CocosPlistFrame_Ffi.get_textureRotated(this);

	inline function set_textureRotated(value:Bool):Bool return CocosPlistFrame_Ffi.set_textureRotated(this, value);
}

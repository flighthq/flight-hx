package flight._cpp;

private extern class CocosPlistFrame_Ffi {
	@:native("flight_field_get_cocos_plist_frame_frame")
	static function get_frame(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_cocos_plist_frame_frame")
	static function set_frame(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_cocos_plist_frame_sprite_offset")
	static function get_spriteOffset(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_cocos_plist_frame_sprite_offset")
	static function set_spriteOffset(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_cocos_plist_frame_sprite_size")
	static function get_spriteSize(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_cocos_plist_frame_sprite_size")
	static function set_spriteSize(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_cocos_plist_frame_sprite_source_size")
	static function get_spriteSourceSize(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_cocos_plist_frame_sprite_source_size")
	static function set_spriteSourceSize(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_cocos_plist_frame_sprite_trimmed") static function get_spriteTrimmed(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_cocos_plist_frame_sprite_trimmed") static function set_spriteTrimmed(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_cocos_plist_frame_texture_rotated") static function get_textureRotated(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_cocos_plist_frame_texture_rotated") static function set_textureRotated(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract CocosPlistFrame(cpp.Star<cpp.Void>) {
	public var frame(get, set):String;
	inline function get_frame():String {
		final bytes = CocosPlistFrame_Ffi.get_frame(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_frame(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		CocosPlistFrame_Ffi.set_frame(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var spriteOffset(get, set):String;
	inline function get_spriteOffset():String {
		final bytes = CocosPlistFrame_Ffi.get_spriteOffset(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_spriteOffset(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		CocosPlistFrame_Ffi.set_spriteOffset(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var spriteSize(get, set):String;
	inline function get_spriteSize():String {
		final bytes = CocosPlistFrame_Ffi.get_spriteSize(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_spriteSize(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		CocosPlistFrame_Ffi.set_spriteSize(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var spriteSourceSize(get, set):String;
	inline function get_spriteSourceSize():String {
		final bytes = CocosPlistFrame_Ffi.get_spriteSourceSize(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_spriteSourceSize(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		CocosPlistFrame_Ffi.set_spriteSourceSize(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var spriteTrimmed(get, set):Bool;

	inline function get_spriteTrimmed():Bool return CocosPlistFrame_Ffi.get_spriteTrimmed(this);

	inline function set_spriteTrimmed(value:Bool):Bool { CocosPlistFrame_Ffi.set_spriteTrimmed(this, value); return value; }
	public var textureRotated(get, set):Bool;

	inline function get_textureRotated():Bool return CocosPlistFrame_Ffi.get_textureRotated(this);

	inline function set_textureRotated(value:Bool):Bool { CocosPlistFrame_Ffi.set_textureRotated(this, value); return value; }
}

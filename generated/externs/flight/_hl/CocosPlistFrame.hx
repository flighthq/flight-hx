package flight._hl;

private extern class CocosPlistFrame_Ffi {
	@:hlNative("flight", "flight_field_get_cocos_plist_frame_frame")
	static function get_frame(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_cocos_plist_frame_frame")
	static function set_frame(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_cocos_plist_frame_sprite_offset")
	static function get_spriteOffset(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_cocos_plist_frame_sprite_offset")
	static function set_spriteOffset(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_cocos_plist_frame_sprite_size")
	static function get_spriteSize(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_cocos_plist_frame_sprite_size")
	static function set_spriteSize(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_cocos_plist_frame_sprite_source_size")
	static function get_spriteSourceSize(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_cocos_plist_frame_sprite_source_size")
	static function set_spriteSourceSize(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract CocosPlistFrame(hl.Bytes) {
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
		CocosPlistFrame_Ffi.set_frame(this, bytes.getData().bytes, bytes.length);
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
		CocosPlistFrame_Ffi.set_spriteOffset(this, bytes.getData().bytes, bytes.length);
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
		CocosPlistFrame_Ffi.set_spriteSize(this, bytes.getData().bytes, bytes.length);
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
		CocosPlistFrame_Ffi.set_spriteSourceSize(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var spriteTrimmed(get, set):Bool;

	inline function get_spriteTrimmed():Bool return this.getUI8(120) != 0;

	inline function set_spriteTrimmed(value:Bool):Bool { this.setUI8(120, value ? 1 : 0); return value; }
	public var textureRotated(get, set):Bool;

	inline function get_textureRotated():Bool return this.getUI8(121) != 0;

	inline function set_textureRotated(value:Bool):Bool { this.setUI8(121, value ? 1 : 0); return value; }
}

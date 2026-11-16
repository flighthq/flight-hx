package flight._cpp;

private extern class RiveFileAsset_Ffi {
	@:native("flight_field_get_rive_file_asset_cdn_base_url")
	static function get_cdnBaseUrl(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_rive_file_asset_cdn_base_url")
	static function set_cdnBaseUrl(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_rive_file_asset_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rive_file_asset_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_rive_file_asset_kind")
	static function get_kind(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_rive_file_asset_kind")
	static function set_kind(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_rive_file_asset_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_rive_file_asset_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_rive_file_asset_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rive_file_asset_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract RiveFileAsset(cpp.Star<cpp.Void>) {
	public var cdnBaseUrl(get, set):String;
	inline function get_cdnBaseUrl():String {
		final bytes = RiveFileAsset_Ffi.get_cdnBaseUrl(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_cdnBaseUrl(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		RiveFileAsset_Ffi.set_cdnBaseUrl(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var height(get, set):Single;

	inline function get_height():Single return RiveFileAsset_Ffi.get_height(this);

	inline function set_height(value:Single):Single { RiveFileAsset_Ffi.set_height(this, value); return value; }
	public var kind(get, set):String;
	inline function get_kind():String {
		final bytes = RiveFileAsset_Ffi.get_kind(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_kind(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		RiveFileAsset_Ffi.set_kind(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var name(get, set):String;
	inline function get_name():String {
		final bytes = RiveFileAsset_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		RiveFileAsset_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var width(get, set):Single;

	inline function get_width():Single return RiveFileAsset_Ffi.get_width(this);

	inline function set_width(value:Single):Single { RiveFileAsset_Ffi.set_width(this, value); return value; }
}

package flight._hl;

private extern class RiveFileAsset_Ffi {
	@:hlNative("flight", "flight_field_get_rive_file_asset_cdn_base_url")
	static function get_cdnBaseUrl(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_rive_file_asset_cdn_base_url")
	static function set_cdnBaseUrl(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_rive_file_asset_kind")
	static function get_kind(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_rive_file_asset_kind")
	static function set_kind(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_rive_file_asset_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_rive_file_asset_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract RiveFileAsset(hl.Bytes) {
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
		RiveFileAsset_Ffi.set_cdnBaseUrl(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(40);

	inline function set_height(value:Single):Single { this.setF32(40, value); return value; }
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
		RiveFileAsset_Ffi.set_kind(this, bytes.getData().bytes, bytes.length);
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
		RiveFileAsset_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(96);

	inline function set_width(value:Single):Single { this.setF32(96, value); return value; }
}

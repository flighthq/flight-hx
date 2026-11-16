package flight._hl;

private extern class RiveArtboardImport_Ffi {
	@:hlNative("flight", "flight_field_get_rive_artboard_import_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_rive_artboard_import_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract RiveArtboardImport(hl.Bytes) {
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(48);

	inline function set_height(value:Single):Single { this.setF32(48, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = RiveArtboardImport_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		RiveArtboardImport_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(344);

	inline function set_width(value:Single):Single { this.setF32(344, value); return value; }
}

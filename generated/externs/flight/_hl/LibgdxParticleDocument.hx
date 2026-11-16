package flight._hl;

private extern class LibgdxParticleDocument_Ffi {
	@:hlNative("flight", "flight_field_get_libgdx_particle_document_image_path")
	static function get_imagePath(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_libgdx_particle_document_image_path")
	static function set_imagePath(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_libgdx_particle_document_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_libgdx_particle_document_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract LibgdxParticleDocument(hl.Bytes) {
	public var additive(get, set):Bool;

	inline function get_additive():Bool return this.getUI8(0) != 0;

	inline function set_additive(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var imageCount(get, set):Single;

	inline function get_imageCount():Single return this.getF32(368);

	inline function set_imageCount(value:Single):Single { this.setF32(368, value); return value; }
	public var imagePath(get, set):String;
	inline function get_imagePath():String {
		final bytes = LibgdxParticleDocument_Ffi.get_imagePath(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_imagePath(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		LibgdxParticleDocument_Ffi.set_imagePath(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var maxParticleCount(get, set):Single;

	inline function get_maxParticleCount():Single return this.getF32(544);

	inline function set_maxParticleCount(value:Single):Single { this.setF32(544, value); return value; }
	public var minParticleCount(get, set):Single;

	inline function get_minParticleCount():Single return this.getF32(548);

	inline function set_minParticleCount(value:Single):Single { this.setF32(548, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = LibgdxParticleDocument_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		LibgdxParticleDocument_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var premultipliedAlpha(get, set):Bool;

	inline function get_premultipliedAlpha():Bool return this.getUI8(576) != 0;

	inline function set_premultipliedAlpha(value:Bool):Bool { this.setUI8(576, value ? 1 : 0); return value; }
}

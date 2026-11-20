package flight._cpp;

private extern class LibgdxParticleDocument_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_libgdx_particle_document_additive") static function get_additive(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_libgdx_particle_document_additive") static function set_additive(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_libgdx_particle_document_image_count") static function get_imageCount(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_libgdx_particle_document_image_count") static function set_imageCount(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_libgdx_particle_document_image_path") static function get_imagePath(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_libgdx_particle_document_image_path") static function set_imagePath(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_libgdx_particle_document_max_particle_count") static function get_maxParticleCount(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_libgdx_particle_document_max_particle_count") static function set_maxParticleCount(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_libgdx_particle_document_min_particle_count") static function get_minParticleCount(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_libgdx_particle_document_min_particle_count") static function set_minParticleCount(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_libgdx_particle_document_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_libgdx_particle_document_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_libgdx_particle_document_premultiplied_alpha") static function get_premultipliedAlpha(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_libgdx_particle_document_premultiplied_alpha") static function set_premultipliedAlpha(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract LibgdxParticleDocument(cpp.Star<cpp.Void>) {
	public var additive(get, set):Bool;

	inline function get_additive():Bool return LibgdxParticleDocument_Ffi.get_additive(this);

	inline function set_additive(value:Bool):Bool { LibgdxParticleDocument_Ffi.set_additive(this, value); return value; }
	public var imageCount(get, set):Single;

	inline function get_imageCount():Single return LibgdxParticleDocument_Ffi.get_imageCount(this);

	inline function set_imageCount(value:Single):Single { LibgdxParticleDocument_Ffi.set_imageCount(this, value); return value; }
	public var imagePath(get, set):String;
	inline function get_imagePath():String { var raw = LibgdxParticleDocument_Ffi.get_imagePath(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); LibgdxParticleDocument_Ffi.freeString(raw); return value; }
	inline function set_imagePath(value:String):String { var raw:cpp.ConstCharStar = cast value; LibgdxParticleDocument_Ffi.set_imagePath(this, raw); return value; }
	public var maxParticleCount(get, set):Single;

	inline function get_maxParticleCount():Single return LibgdxParticleDocument_Ffi.get_maxParticleCount(this);

	inline function set_maxParticleCount(value:Single):Single { LibgdxParticleDocument_Ffi.set_maxParticleCount(this, value); return value; }
	public var minParticleCount(get, set):Single;

	inline function get_minParticleCount():Single return LibgdxParticleDocument_Ffi.get_minParticleCount(this);

	inline function set_minParticleCount(value:Single):Single { LibgdxParticleDocument_Ffi.set_minParticleCount(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = LibgdxParticleDocument_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); LibgdxParticleDocument_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; LibgdxParticleDocument_Ffi.set_name(this, raw); return value; }
	public var premultipliedAlpha(get, set):Bool;

	inline function get_premultipliedAlpha():Bool return LibgdxParticleDocument_Ffi.get_premultipliedAlpha(this);

	inline function set_premultipliedAlpha(value:Bool):Bool { LibgdxParticleDocument_Ffi.set_premultipliedAlpha(this, value); return value; }
}

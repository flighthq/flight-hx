package flight._js;

@:jsRequire("flight")
private extern class LibgdxParticleDocument_Ffi {
	@:native("flight_get_libgdx_particle_document_additive") static function get_additive(ptr:Dynamic):Bool;
	@:native("flight_set_libgdx_particle_document_additive") static function set_additive(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_libgdx_particle_document_image_count") static function get_imageCount(ptr:Dynamic):Float;
	@:native("flight_set_libgdx_particle_document_image_count") static function set_imageCount(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_libgdx_particle_document_max_particle_count") static function get_maxParticleCount(ptr:Dynamic):Float;
	@:native("flight_set_libgdx_particle_document_max_particle_count") static function set_maxParticleCount(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_libgdx_particle_document_min_particle_count") static function get_minParticleCount(ptr:Dynamic):Float;
	@:native("flight_set_libgdx_particle_document_min_particle_count") static function set_minParticleCount(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_libgdx_particle_document_premultiplied_alpha") static function get_premultipliedAlpha(ptr:Dynamic):Bool;
	@:native("flight_set_libgdx_particle_document_premultiplied_alpha") static function set_premultipliedAlpha(ptr:Dynamic, value:Bool):Bool;
}

abstract LibgdxParticleDocument(Dynamic) {
	public var additive(get, set):Bool;

	inline function get_additive():Bool return LibgdxParticleDocument_Ffi.get_additive(this);

	inline function set_additive(value:Bool):Bool return LibgdxParticleDocument_Ffi.set_additive(this, value);
	public var imageCount(get, set):Float;

	inline function get_imageCount():Float return LibgdxParticleDocument_Ffi.get_imageCount(this);

	inline function set_imageCount(value:Float):Float return LibgdxParticleDocument_Ffi.set_imageCount(this, value);
	public var maxParticleCount(get, set):Float;

	inline function get_maxParticleCount():Float return LibgdxParticleDocument_Ffi.get_maxParticleCount(this);

	inline function set_maxParticleCount(value:Float):Float return LibgdxParticleDocument_Ffi.set_maxParticleCount(this, value);
	public var minParticleCount(get, set):Float;

	inline function get_minParticleCount():Float return LibgdxParticleDocument_Ffi.get_minParticleCount(this);

	inline function set_minParticleCount(value:Float):Float return LibgdxParticleDocument_Ffi.set_minParticleCount(this, value);
	public var premultipliedAlpha(get, set):Bool;

	inline function get_premultipliedAlpha():Bool return LibgdxParticleDocument_Ffi.get_premultipliedAlpha(this);

	inline function set_premultipliedAlpha(value:Bool):Bool return LibgdxParticleDocument_Ffi.set_premultipliedAlpha(this, value);
}

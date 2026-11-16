package flight._cpp;

private extern class SpineParticleDocument_Ffi {
	@:native("flight_get_spine_particle_document_continuous") static function get_continuous(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_spine_particle_document_continuous") static function set_continuous(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_spine_particle_document_duration") static function get_duration(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spine_particle_document_duration") static function set_duration(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spine_particle_document_max_particles") static function get_maxParticles(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spine_particle_document_max_particles") static function set_maxParticles(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spine_particle_document_premultiplied") static function get_premultiplied(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_spine_particle_document_premultiplied") static function set_premultiplied(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract SpineParticleDocument(cpp.Star<cpp.Void>) {
	public var continuous(get, set):Bool;

	inline function get_continuous():Bool return SpineParticleDocument_Ffi.get_continuous(this);

	inline function set_continuous(value:Bool):Bool { SpineParticleDocument_Ffi.set_continuous(this, value); return value; }
	public var duration(get, set):Single;

	inline function get_duration():Single return SpineParticleDocument_Ffi.get_duration(this);

	inline function set_duration(value:Single):Single { SpineParticleDocument_Ffi.set_duration(this, value); return value; }
	public var maxParticles(get, set):Single;

	inline function get_maxParticles():Single return SpineParticleDocument_Ffi.get_maxParticles(this);

	inline function set_maxParticles(value:Single):Single { SpineParticleDocument_Ffi.set_maxParticles(this, value); return value; }
	public var premultiplied(get, set):Bool;

	inline function get_premultiplied():Bool return SpineParticleDocument_Ffi.get_premultiplied(this);

	inline function set_premultiplied(value:Bool):Bool { SpineParticleDocument_Ffi.set_premultiplied(this, value); return value; }
}

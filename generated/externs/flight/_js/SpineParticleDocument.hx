package flight._js;

@:jsRequire("flight")
private extern class SpineParticleDocument_Ffi {
	@:native("flight_get_spine_particle_document_continuous") static function get_continuous(ptr:Dynamic):Bool;
	@:native("flight_set_spine_particle_document_continuous") static function set_continuous(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_spine_particle_document_duration") static function get_duration(ptr:Dynamic):Float;
	@:native("flight_set_spine_particle_document_duration") static function set_duration(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spine_particle_document_max_particles") static function get_maxParticles(ptr:Dynamic):Float;
	@:native("flight_set_spine_particle_document_max_particles") static function set_maxParticles(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spine_particle_document_premultiplied") static function get_premultiplied(ptr:Dynamic):Bool;
	@:native("flight_set_spine_particle_document_premultiplied") static function set_premultiplied(ptr:Dynamic, value:Bool):Bool;
}

abstract SpineParticleDocument(Dynamic) {
	public var continuous(get, set):Bool;

	inline function get_continuous():Bool return SpineParticleDocument_Ffi.get_continuous(this);

	inline function set_continuous(value:Bool):Bool return SpineParticleDocument_Ffi.set_continuous(this, value);
	public var duration(get, set):Float;

	inline function get_duration():Float return SpineParticleDocument_Ffi.get_duration(this);

	inline function set_duration(value:Float):Float return SpineParticleDocument_Ffi.set_duration(this, value);
	public var maxParticles(get, set):Float;

	inline function get_maxParticles():Float return SpineParticleDocument_Ffi.get_maxParticles(this);

	inline function set_maxParticles(value:Float):Float return SpineParticleDocument_Ffi.set_maxParticles(this, value);
	public var premultiplied(get, set):Bool;

	inline function get_premultiplied():Bool return SpineParticleDocument_Ffi.get_premultiplied(this);

	inline function set_premultiplied(value:Bool):Bool return SpineParticleDocument_Ffi.set_premultiplied(this, value);
}

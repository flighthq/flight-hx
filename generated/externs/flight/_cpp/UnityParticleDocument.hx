package flight._cpp;

private extern class UnityParticleDocument_Ffi {
	@:native("flight_get_unity_particle_document_duration") static function get_duration(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_particle_document_duration") static function set_duration(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_unity_particle_document_gravity_modifier") static function get_gravityModifier(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_particle_document_gravity_modifier") static function set_gravityModifier(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_unity_particle_document_looping") static function get_looping(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_unity_particle_document_looping") static function set_looping(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_unity_particle_document_max_particles") static function get_maxParticles(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_particle_document_max_particles") static function set_maxParticles(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_unity_particle_document_physics_gravity") static function get_physicsGravity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unity_particle_document_physics_gravity") static function set_physicsGravity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_unity_particle_document_prewarm") static function get_prewarm(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_unity_particle_document_prewarm") static function set_prewarm(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract UnityParticleDocument(cpp.Star<cpp.Void>) {
	public var duration(get, set):Single;

	inline function get_duration():Single return UnityParticleDocument_Ffi.get_duration(this);

	inline function set_duration(value:Single):Single return UnityParticleDocument_Ffi.set_duration(this, value);
	public var gravityModifier(get, set):Single;

	inline function get_gravityModifier():Single return UnityParticleDocument_Ffi.get_gravityModifier(this);

	inline function set_gravityModifier(value:Single):Single return UnityParticleDocument_Ffi.set_gravityModifier(this, value);
	public var looping(get, set):Bool;

	inline function get_looping():Bool return UnityParticleDocument_Ffi.get_looping(this);

	inline function set_looping(value:Bool):Bool return UnityParticleDocument_Ffi.set_looping(this, value);
	public var maxParticles(get, set):Single;

	inline function get_maxParticles():Single return UnityParticleDocument_Ffi.get_maxParticles(this);

	inline function set_maxParticles(value:Single):Single return UnityParticleDocument_Ffi.set_maxParticles(this, value);
	public var physicsGravity(get, set):Single;

	inline function get_physicsGravity():Single return UnityParticleDocument_Ffi.get_physicsGravity(this);

	inline function set_physicsGravity(value:Single):Single return UnityParticleDocument_Ffi.set_physicsGravity(this, value);
	public var prewarm(get, set):Bool;

	inline function get_prewarm():Bool return UnityParticleDocument_Ffi.get_prewarm(this);

	inline function set_prewarm(value:Bool):Bool return UnityParticleDocument_Ffi.set_prewarm(this, value);
}

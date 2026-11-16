package flight._cpp;

private extern class ParticleObjectsUpdateOptions_Ffi {
	@:native("flight_get_particle_objects_update_options_emitter_x") static function get_emitterX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_objects_update_options_emitter_x") static function set_emitterX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_objects_update_options_emitter_y") static function get_emitterY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_objects_update_options_emitter_y") static function set_emitterY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ParticleObjectsUpdateOptions(cpp.Star<cpp.Void>) {
	public var emitterX(get, set):Single;

	inline function get_emitterX():Single return ParticleObjectsUpdateOptions_Ffi.get_emitterX(this);

	inline function set_emitterX(value:Single):Single { ParticleObjectsUpdateOptions_Ffi.set_emitterX(this, value); return value; }
	public var emitterY(get, set):Single;

	inline function get_emitterY():Single return ParticleObjectsUpdateOptions_Ffi.get_emitterY(this);

	inline function set_emitterY(value:Single):Single { ParticleObjectsUpdateOptions_Ffi.set_emitterY(this, value); return value; }
}

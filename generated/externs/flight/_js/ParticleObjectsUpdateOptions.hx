package flight._js;

@:jsRequire("flight")
private extern class ParticleObjectsUpdateOptions_Ffi {
	@:native("flight_get_particle_objects_update_options_emitter_x") static function get_emitterX(ptr:Dynamic):Float;
	@:native("flight_set_particle_objects_update_options_emitter_x") static function set_emitterX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_objects_update_options_emitter_y") static function get_emitterY(ptr:Dynamic):Float;
	@:native("flight_set_particle_objects_update_options_emitter_y") static function set_emitterY(ptr:Dynamic, value:Float):Float;
}

abstract ParticleObjectsUpdateOptions(Dynamic) {
	public var emitterX(get, set):Float;

	inline function get_emitterX():Float return ParticleObjectsUpdateOptions_Ffi.get_emitterX(this);

	inline function set_emitterX(value:Float):Float return ParticleObjectsUpdateOptions_Ffi.set_emitterX(this, value);
	public var emitterY(get, set):Float;

	inline function get_emitterY():Float return ParticleObjectsUpdateOptions_Ffi.get_emitterY(this);

	inline function set_emitterY(value:Float):Float return ParticleObjectsUpdateOptions_Ffi.set_emitterY(this, value);
}

package flight._js;

@:jsRequire("flight")
private extern class ParticleDesignerDocument_Ffi {
	@:native("flight_get_particle_designer_document_angle") static function get_angle(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_angle") static function set_angle(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_angle_variance") static function get_angleVariance(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_angle_variance") static function set_angleVariance(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_blend_func_destination") static function get_blendFuncDestination(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_blend_func_destination") static function set_blendFuncDestination(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_blend_func_source") static function get_blendFuncSource(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_blend_func_source") static function set_blendFuncSource(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_duration") static function get_duration(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_duration") static function set_duration(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_finish_color_alpha") static function get_finishColorAlpha(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_finish_color_alpha") static function set_finishColorAlpha(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_finish_color_blue") static function get_finishColorBlue(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_finish_color_blue") static function set_finishColorBlue(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_finish_color_green") static function get_finishColorGreen(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_finish_color_green") static function set_finishColorGreen(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_finish_color_red") static function get_finishColorRed(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_finish_color_red") static function set_finishColorRed(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_finish_color_variance_alpha") static function get_finishColorVarianceAlpha(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_finish_color_variance_alpha") static function set_finishColorVarianceAlpha(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_finish_color_variance_blue") static function get_finishColorVarianceBlue(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_finish_color_variance_blue") static function set_finishColorVarianceBlue(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_finish_color_variance_green") static function get_finishColorVarianceGreen(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_finish_color_variance_green") static function set_finishColorVarianceGreen(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_finish_color_variance_red") static function get_finishColorVarianceRed(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_finish_color_variance_red") static function set_finishColorVarianceRed(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_finish_particle_size") static function get_finishParticleSize(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_finish_particle_size") static function set_finishParticleSize(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_finish_particle_size_variance") static function get_finishParticleSizeVariance(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_finish_particle_size_variance") static function set_finishParticleSizeVariance(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_gravityx") static function get_gravityx(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_gravityx") static function set_gravityx(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_gravityy") static function get_gravityy(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_gravityy") static function set_gravityy(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_max_particles") static function get_maxParticles(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_max_particles") static function set_maxParticles(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_max_radius") static function get_maxRadius(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_max_radius") static function set_maxRadius(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_max_radius_variance") static function get_maxRadiusVariance(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_max_radius_variance") static function set_maxRadiusVariance(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_min_radius") static function get_minRadius(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_min_radius") static function set_minRadius(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_min_radius_variance") static function get_minRadiusVariance(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_min_radius_variance") static function set_minRadiusVariance(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_particle_lifespan") static function get_particleLifespan(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_particle_lifespan") static function set_particleLifespan(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_particle_lifespan_variance") static function get_particleLifespanVariance(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_particle_lifespan_variance") static function set_particleLifespanVariance(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_rotate_per_second") static function get_rotatePerSecond(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_rotate_per_second") static function set_rotatePerSecond(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_rotate_per_second_variance") static function get_rotatePerSecondVariance(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_rotate_per_second_variance") static function set_rotatePerSecondVariance(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_rotation_end") static function get_rotationEnd(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_rotation_end") static function set_rotationEnd(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_rotation_end_variance") static function get_rotationEndVariance(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_rotation_end_variance") static function set_rotationEndVariance(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_rotation_start") static function get_rotationStart(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_rotation_start") static function set_rotationStart(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_rotation_start_variance") static function get_rotationStartVariance(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_rotation_start_variance") static function set_rotationStartVariance(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_source_position_variancex") static function get_sourcePositionVariancex(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_source_position_variancex") static function set_sourcePositionVariancex(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_source_position_variancey") static function get_sourcePositionVariancey(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_source_position_variancey") static function set_sourcePositionVariancey(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_speed") static function get_speed(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_speed") static function set_speed(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_speed_variance") static function get_speedVariance(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_speed_variance") static function set_speedVariance(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_start_color_alpha") static function get_startColorAlpha(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_start_color_alpha") static function set_startColorAlpha(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_start_color_blue") static function get_startColorBlue(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_start_color_blue") static function set_startColorBlue(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_start_color_green") static function get_startColorGreen(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_start_color_green") static function set_startColorGreen(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_start_color_red") static function get_startColorRed(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_start_color_red") static function set_startColorRed(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_start_color_variance_alpha") static function get_startColorVarianceAlpha(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_start_color_variance_alpha") static function set_startColorVarianceAlpha(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_start_color_variance_blue") static function get_startColorVarianceBlue(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_start_color_variance_blue") static function set_startColorVarianceBlue(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_start_color_variance_green") static function get_startColorVarianceGreen(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_start_color_variance_green") static function set_startColorVarianceGreen(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_start_color_variance_red") static function get_startColorVarianceRed(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_start_color_variance_red") static function set_startColorVarianceRed(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_start_particle_size") static function get_startParticleSize(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_start_particle_size") static function set_startParticleSize(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_designer_document_start_particle_size_variance") static function get_startParticleSizeVariance(ptr:Dynamic):Float;
	@:native("flight_set_particle_designer_document_start_particle_size_variance") static function set_startParticleSizeVariance(ptr:Dynamic, value:Float):Float;
}

abstract ParticleDesignerDocument(Dynamic) {
	public var angle(get, set):Float;

	inline function get_angle():Float return ParticleDesignerDocument_Ffi.get_angle(this);

	inline function set_angle(value:Float):Float return ParticleDesignerDocument_Ffi.set_angle(this, value);
	public var angleVariance(get, set):Float;

	inline function get_angleVariance():Float return ParticleDesignerDocument_Ffi.get_angleVariance(this);

	inline function set_angleVariance(value:Float):Float return ParticleDesignerDocument_Ffi.set_angleVariance(this, value);
	public var blendFuncDestination(get, set):Float;

	inline function get_blendFuncDestination():Float return ParticleDesignerDocument_Ffi.get_blendFuncDestination(this);

	inline function set_blendFuncDestination(value:Float):Float return ParticleDesignerDocument_Ffi.set_blendFuncDestination(this, value);
	public var blendFuncSource(get, set):Float;

	inline function get_blendFuncSource():Float return ParticleDesignerDocument_Ffi.get_blendFuncSource(this);

	inline function set_blendFuncSource(value:Float):Float return ParticleDesignerDocument_Ffi.set_blendFuncSource(this, value);
	public var duration(get, set):Float;

	inline function get_duration():Float return ParticleDesignerDocument_Ffi.get_duration(this);

	inline function set_duration(value:Float):Float return ParticleDesignerDocument_Ffi.set_duration(this, value);
	public var finishColorAlpha(get, set):Float;

	inline function get_finishColorAlpha():Float return ParticleDesignerDocument_Ffi.get_finishColorAlpha(this);

	inline function set_finishColorAlpha(value:Float):Float return ParticleDesignerDocument_Ffi.set_finishColorAlpha(this, value);
	public var finishColorBlue(get, set):Float;

	inline function get_finishColorBlue():Float return ParticleDesignerDocument_Ffi.get_finishColorBlue(this);

	inline function set_finishColorBlue(value:Float):Float return ParticleDesignerDocument_Ffi.set_finishColorBlue(this, value);
	public var finishColorGreen(get, set):Float;

	inline function get_finishColorGreen():Float return ParticleDesignerDocument_Ffi.get_finishColorGreen(this);

	inline function set_finishColorGreen(value:Float):Float return ParticleDesignerDocument_Ffi.set_finishColorGreen(this, value);
	public var finishColorRed(get, set):Float;

	inline function get_finishColorRed():Float return ParticleDesignerDocument_Ffi.get_finishColorRed(this);

	inline function set_finishColorRed(value:Float):Float return ParticleDesignerDocument_Ffi.set_finishColorRed(this, value);
	public var finishColorVarianceAlpha(get, set):Float;

	inline function get_finishColorVarianceAlpha():Float return ParticleDesignerDocument_Ffi.get_finishColorVarianceAlpha(this);

	inline function set_finishColorVarianceAlpha(value:Float):Float return ParticleDesignerDocument_Ffi.set_finishColorVarianceAlpha(this, value);
	public var finishColorVarianceBlue(get, set):Float;

	inline function get_finishColorVarianceBlue():Float return ParticleDesignerDocument_Ffi.get_finishColorVarianceBlue(this);

	inline function set_finishColorVarianceBlue(value:Float):Float return ParticleDesignerDocument_Ffi.set_finishColorVarianceBlue(this, value);
	public var finishColorVarianceGreen(get, set):Float;

	inline function get_finishColorVarianceGreen():Float return ParticleDesignerDocument_Ffi.get_finishColorVarianceGreen(this);

	inline function set_finishColorVarianceGreen(value:Float):Float return ParticleDesignerDocument_Ffi.set_finishColorVarianceGreen(this, value);
	public var finishColorVarianceRed(get, set):Float;

	inline function get_finishColorVarianceRed():Float return ParticleDesignerDocument_Ffi.get_finishColorVarianceRed(this);

	inline function set_finishColorVarianceRed(value:Float):Float return ParticleDesignerDocument_Ffi.set_finishColorVarianceRed(this, value);
	public var finishParticleSize(get, set):Float;

	inline function get_finishParticleSize():Float return ParticleDesignerDocument_Ffi.get_finishParticleSize(this);

	inline function set_finishParticleSize(value:Float):Float return ParticleDesignerDocument_Ffi.set_finishParticleSize(this, value);
	public var finishParticleSizeVariance(get, set):Float;

	inline function get_finishParticleSizeVariance():Float return ParticleDesignerDocument_Ffi.get_finishParticleSizeVariance(this);

	inline function set_finishParticleSizeVariance(value:Float):Float return ParticleDesignerDocument_Ffi.set_finishParticleSizeVariance(this, value);
	public var gravityx(get, set):Float;

	inline function get_gravityx():Float return ParticleDesignerDocument_Ffi.get_gravityx(this);

	inline function set_gravityx(value:Float):Float return ParticleDesignerDocument_Ffi.set_gravityx(this, value);
	public var gravityy(get, set):Float;

	inline function get_gravityy():Float return ParticleDesignerDocument_Ffi.get_gravityy(this);

	inline function set_gravityy(value:Float):Float return ParticleDesignerDocument_Ffi.set_gravityy(this, value);
	public var maxParticles(get, set):Float;

	inline function get_maxParticles():Float return ParticleDesignerDocument_Ffi.get_maxParticles(this);

	inline function set_maxParticles(value:Float):Float return ParticleDesignerDocument_Ffi.set_maxParticles(this, value);
	public var maxRadius(get, set):Float;

	inline function get_maxRadius():Float return ParticleDesignerDocument_Ffi.get_maxRadius(this);

	inline function set_maxRadius(value:Float):Float return ParticleDesignerDocument_Ffi.set_maxRadius(this, value);
	public var maxRadiusVariance(get, set):Float;

	inline function get_maxRadiusVariance():Float return ParticleDesignerDocument_Ffi.get_maxRadiusVariance(this);

	inline function set_maxRadiusVariance(value:Float):Float return ParticleDesignerDocument_Ffi.set_maxRadiusVariance(this, value);
	public var minRadius(get, set):Float;

	inline function get_minRadius():Float return ParticleDesignerDocument_Ffi.get_minRadius(this);

	inline function set_minRadius(value:Float):Float return ParticleDesignerDocument_Ffi.set_minRadius(this, value);
	public var minRadiusVariance(get, set):Float;

	inline function get_minRadiusVariance():Float return ParticleDesignerDocument_Ffi.get_minRadiusVariance(this);

	inline function set_minRadiusVariance(value:Float):Float return ParticleDesignerDocument_Ffi.set_minRadiusVariance(this, value);
	public var particleLifespan(get, set):Float;

	inline function get_particleLifespan():Float return ParticleDesignerDocument_Ffi.get_particleLifespan(this);

	inline function set_particleLifespan(value:Float):Float return ParticleDesignerDocument_Ffi.set_particleLifespan(this, value);
	public var particleLifespanVariance(get, set):Float;

	inline function get_particleLifespanVariance():Float return ParticleDesignerDocument_Ffi.get_particleLifespanVariance(this);

	inline function set_particleLifespanVariance(value:Float):Float return ParticleDesignerDocument_Ffi.set_particleLifespanVariance(this, value);
	public var rotatePerSecond(get, set):Float;

	inline function get_rotatePerSecond():Float return ParticleDesignerDocument_Ffi.get_rotatePerSecond(this);

	inline function set_rotatePerSecond(value:Float):Float return ParticleDesignerDocument_Ffi.set_rotatePerSecond(this, value);
	public var rotatePerSecondVariance(get, set):Float;

	inline function get_rotatePerSecondVariance():Float return ParticleDesignerDocument_Ffi.get_rotatePerSecondVariance(this);

	inline function set_rotatePerSecondVariance(value:Float):Float return ParticleDesignerDocument_Ffi.set_rotatePerSecondVariance(this, value);
	public var rotationEnd(get, set):Float;

	inline function get_rotationEnd():Float return ParticleDesignerDocument_Ffi.get_rotationEnd(this);

	inline function set_rotationEnd(value:Float):Float return ParticleDesignerDocument_Ffi.set_rotationEnd(this, value);
	public var rotationEndVariance(get, set):Float;

	inline function get_rotationEndVariance():Float return ParticleDesignerDocument_Ffi.get_rotationEndVariance(this);

	inline function set_rotationEndVariance(value:Float):Float return ParticleDesignerDocument_Ffi.set_rotationEndVariance(this, value);
	public var rotationStart(get, set):Float;

	inline function get_rotationStart():Float return ParticleDesignerDocument_Ffi.get_rotationStart(this);

	inline function set_rotationStart(value:Float):Float return ParticleDesignerDocument_Ffi.set_rotationStart(this, value);
	public var rotationStartVariance(get, set):Float;

	inline function get_rotationStartVariance():Float return ParticleDesignerDocument_Ffi.get_rotationStartVariance(this);

	inline function set_rotationStartVariance(value:Float):Float return ParticleDesignerDocument_Ffi.set_rotationStartVariance(this, value);
	public var sourcePositionVariancex(get, set):Float;

	inline function get_sourcePositionVariancex():Float return ParticleDesignerDocument_Ffi.get_sourcePositionVariancex(this);

	inline function set_sourcePositionVariancex(value:Float):Float return ParticleDesignerDocument_Ffi.set_sourcePositionVariancex(this, value);
	public var sourcePositionVariancey(get, set):Float;

	inline function get_sourcePositionVariancey():Float return ParticleDesignerDocument_Ffi.get_sourcePositionVariancey(this);

	inline function set_sourcePositionVariancey(value:Float):Float return ParticleDesignerDocument_Ffi.set_sourcePositionVariancey(this, value);
	public var speed(get, set):Float;

	inline function get_speed():Float return ParticleDesignerDocument_Ffi.get_speed(this);

	inline function set_speed(value:Float):Float return ParticleDesignerDocument_Ffi.set_speed(this, value);
	public var speedVariance(get, set):Float;

	inline function get_speedVariance():Float return ParticleDesignerDocument_Ffi.get_speedVariance(this);

	inline function set_speedVariance(value:Float):Float return ParticleDesignerDocument_Ffi.set_speedVariance(this, value);
	public var startColorAlpha(get, set):Float;

	inline function get_startColorAlpha():Float return ParticleDesignerDocument_Ffi.get_startColorAlpha(this);

	inline function set_startColorAlpha(value:Float):Float return ParticleDesignerDocument_Ffi.set_startColorAlpha(this, value);
	public var startColorBlue(get, set):Float;

	inline function get_startColorBlue():Float return ParticleDesignerDocument_Ffi.get_startColorBlue(this);

	inline function set_startColorBlue(value:Float):Float return ParticleDesignerDocument_Ffi.set_startColorBlue(this, value);
	public var startColorGreen(get, set):Float;

	inline function get_startColorGreen():Float return ParticleDesignerDocument_Ffi.get_startColorGreen(this);

	inline function set_startColorGreen(value:Float):Float return ParticleDesignerDocument_Ffi.set_startColorGreen(this, value);
	public var startColorRed(get, set):Float;

	inline function get_startColorRed():Float return ParticleDesignerDocument_Ffi.get_startColorRed(this);

	inline function set_startColorRed(value:Float):Float return ParticleDesignerDocument_Ffi.set_startColorRed(this, value);
	public var startColorVarianceAlpha(get, set):Float;

	inline function get_startColorVarianceAlpha():Float return ParticleDesignerDocument_Ffi.get_startColorVarianceAlpha(this);

	inline function set_startColorVarianceAlpha(value:Float):Float return ParticleDesignerDocument_Ffi.set_startColorVarianceAlpha(this, value);
	public var startColorVarianceBlue(get, set):Float;

	inline function get_startColorVarianceBlue():Float return ParticleDesignerDocument_Ffi.get_startColorVarianceBlue(this);

	inline function set_startColorVarianceBlue(value:Float):Float return ParticleDesignerDocument_Ffi.set_startColorVarianceBlue(this, value);
	public var startColorVarianceGreen(get, set):Float;

	inline function get_startColorVarianceGreen():Float return ParticleDesignerDocument_Ffi.get_startColorVarianceGreen(this);

	inline function set_startColorVarianceGreen(value:Float):Float return ParticleDesignerDocument_Ffi.set_startColorVarianceGreen(this, value);
	public var startColorVarianceRed(get, set):Float;

	inline function get_startColorVarianceRed():Float return ParticleDesignerDocument_Ffi.get_startColorVarianceRed(this);

	inline function set_startColorVarianceRed(value:Float):Float return ParticleDesignerDocument_Ffi.set_startColorVarianceRed(this, value);
	public var startParticleSize(get, set):Float;

	inline function get_startParticleSize():Float return ParticleDesignerDocument_Ffi.get_startParticleSize(this);

	inline function set_startParticleSize(value:Float):Float return ParticleDesignerDocument_Ffi.set_startParticleSize(this, value);
	public var startParticleSizeVariance(get, set):Float;

	inline function get_startParticleSizeVariance():Float return ParticleDesignerDocument_Ffi.get_startParticleSizeVariance(this);

	inline function set_startParticleSizeVariance(value:Float):Float return ParticleDesignerDocument_Ffi.set_startParticleSizeVariance(this, value);
}

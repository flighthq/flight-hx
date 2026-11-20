package flight._cpp;

private extern class ParticleDesignerDocument_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_particle_designer_document_angle") static function get_angle(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_angle") static function set_angle(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_angle_variance") static function get_angleVariance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_angle_variance") static function set_angleVariance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_blend_func_destination") static function get_blendFuncDestination(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_blend_func_destination") static function set_blendFuncDestination(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_blend_func_source") static function get_blendFuncSource(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_blend_func_source") static function set_blendFuncSource(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_duration") static function get_duration(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_duration") static function set_duration(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_finish_color_alpha") static function get_finishColorAlpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_finish_color_alpha") static function set_finishColorAlpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_finish_color_blue") static function get_finishColorBlue(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_finish_color_blue") static function set_finishColorBlue(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_finish_color_green") static function get_finishColorGreen(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_finish_color_green") static function set_finishColorGreen(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_finish_color_red") static function get_finishColorRed(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_finish_color_red") static function set_finishColorRed(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_finish_color_variance_alpha") static function get_finishColorVarianceAlpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_finish_color_variance_alpha") static function set_finishColorVarianceAlpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_finish_color_variance_blue") static function get_finishColorVarianceBlue(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_finish_color_variance_blue") static function set_finishColorVarianceBlue(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_finish_color_variance_green") static function get_finishColorVarianceGreen(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_finish_color_variance_green") static function set_finishColorVarianceGreen(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_finish_color_variance_red") static function get_finishColorVarianceRed(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_finish_color_variance_red") static function set_finishColorVarianceRed(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_finish_particle_size") static function get_finishParticleSize(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_finish_particle_size") static function set_finishParticleSize(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_finish_particle_size_variance") static function get_finishParticleSizeVariance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_finish_particle_size_variance") static function set_finishParticleSizeVariance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_gravityx") static function get_gravityx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_gravityx") static function set_gravityx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_gravityy") static function get_gravityy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_gravityy") static function set_gravityy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_max_particles") static function get_maxParticles(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_max_particles") static function set_maxParticles(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_max_radius") static function get_maxRadius(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_max_radius") static function set_maxRadius(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_max_radius_variance") static function get_maxRadiusVariance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_max_radius_variance") static function set_maxRadiusVariance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_min_radius") static function get_minRadius(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_min_radius") static function set_minRadius(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_min_radius_variance") static function get_minRadiusVariance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_min_radius_variance") static function set_minRadiusVariance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_particle_lifespan") static function get_particleLifespan(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_particle_lifespan") static function set_particleLifespan(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_particle_lifespan_variance") static function get_particleLifespanVariance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_particle_lifespan_variance") static function set_particleLifespanVariance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_rotate_per_second") static function get_rotatePerSecond(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_rotate_per_second") static function set_rotatePerSecond(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_rotate_per_second_variance") static function get_rotatePerSecondVariance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_rotate_per_second_variance") static function set_rotatePerSecondVariance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_rotation_end") static function get_rotationEnd(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_rotation_end") static function set_rotationEnd(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_rotation_end_variance") static function get_rotationEndVariance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_rotation_end_variance") static function set_rotationEndVariance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_rotation_start") static function get_rotationStart(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_rotation_start") static function set_rotationStart(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_rotation_start_variance") static function get_rotationStartVariance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_rotation_start_variance") static function set_rotationStartVariance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_source_position_variancex") static function get_sourcePositionVariancex(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_source_position_variancex") static function set_sourcePositionVariancex(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_source_position_variancey") static function get_sourcePositionVariancey(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_source_position_variancey") static function set_sourcePositionVariancey(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_speed") static function get_speed(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_speed") static function set_speed(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_speed_variance") static function get_speedVariance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_speed_variance") static function set_speedVariance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_start_color_alpha") static function get_startColorAlpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_start_color_alpha") static function set_startColorAlpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_start_color_blue") static function get_startColorBlue(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_start_color_blue") static function set_startColorBlue(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_start_color_green") static function get_startColorGreen(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_start_color_green") static function set_startColorGreen(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_start_color_red") static function get_startColorRed(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_start_color_red") static function set_startColorRed(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_start_color_variance_alpha") static function get_startColorVarianceAlpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_start_color_variance_alpha") static function set_startColorVarianceAlpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_start_color_variance_blue") static function get_startColorVarianceBlue(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_start_color_variance_blue") static function set_startColorVarianceBlue(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_start_color_variance_green") static function get_startColorVarianceGreen(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_start_color_variance_green") static function set_startColorVarianceGreen(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_start_color_variance_red") static function get_startColorVarianceRed(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_start_color_variance_red") static function set_startColorVarianceRed(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_start_particle_size") static function get_startParticleSize(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_start_particle_size") static function set_startParticleSize(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_designer_document_start_particle_size_variance") static function get_startParticleSizeVariance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_designer_document_start_particle_size_variance") static function set_startParticleSizeVariance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_particle_designer_document_texture_file_name") static function get_textureFileName(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_particle_designer_document_texture_file_name") static function set_textureFileName(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ParticleDesignerDocument(cpp.Star<cpp.Void>) {
	public var angle(get, set):Single;

	inline function get_angle():Single return ParticleDesignerDocument_Ffi.get_angle(this);

	inline function set_angle(value:Single):Single { ParticleDesignerDocument_Ffi.set_angle(this, value); return value; }
	public var angleVariance(get, set):Single;

	inline function get_angleVariance():Single return ParticleDesignerDocument_Ffi.get_angleVariance(this);

	inline function set_angleVariance(value:Single):Single { ParticleDesignerDocument_Ffi.set_angleVariance(this, value); return value; }
	public var blendFuncDestination(get, set):Single;

	inline function get_blendFuncDestination():Single return ParticleDesignerDocument_Ffi.get_blendFuncDestination(this);

	inline function set_blendFuncDestination(value:Single):Single { ParticleDesignerDocument_Ffi.set_blendFuncDestination(this, value); return value; }
	public var blendFuncSource(get, set):Single;

	inline function get_blendFuncSource():Single return ParticleDesignerDocument_Ffi.get_blendFuncSource(this);

	inline function set_blendFuncSource(value:Single):Single { ParticleDesignerDocument_Ffi.set_blendFuncSource(this, value); return value; }
	public var duration(get, set):Single;

	inline function get_duration():Single return ParticleDesignerDocument_Ffi.get_duration(this);

	inline function set_duration(value:Single):Single { ParticleDesignerDocument_Ffi.set_duration(this, value); return value; }
	public var finishColorAlpha(get, set):Single;

	inline function get_finishColorAlpha():Single return ParticleDesignerDocument_Ffi.get_finishColorAlpha(this);

	inline function set_finishColorAlpha(value:Single):Single { ParticleDesignerDocument_Ffi.set_finishColorAlpha(this, value); return value; }
	public var finishColorBlue(get, set):Single;

	inline function get_finishColorBlue():Single return ParticleDesignerDocument_Ffi.get_finishColorBlue(this);

	inline function set_finishColorBlue(value:Single):Single { ParticleDesignerDocument_Ffi.set_finishColorBlue(this, value); return value; }
	public var finishColorGreen(get, set):Single;

	inline function get_finishColorGreen():Single return ParticleDesignerDocument_Ffi.get_finishColorGreen(this);

	inline function set_finishColorGreen(value:Single):Single { ParticleDesignerDocument_Ffi.set_finishColorGreen(this, value); return value; }
	public var finishColorRed(get, set):Single;

	inline function get_finishColorRed():Single return ParticleDesignerDocument_Ffi.get_finishColorRed(this);

	inline function set_finishColorRed(value:Single):Single { ParticleDesignerDocument_Ffi.set_finishColorRed(this, value); return value; }
	public var finishColorVarianceAlpha(get, set):Single;

	inline function get_finishColorVarianceAlpha():Single return ParticleDesignerDocument_Ffi.get_finishColorVarianceAlpha(this);

	inline function set_finishColorVarianceAlpha(value:Single):Single { ParticleDesignerDocument_Ffi.set_finishColorVarianceAlpha(this, value); return value; }
	public var finishColorVarianceBlue(get, set):Single;

	inline function get_finishColorVarianceBlue():Single return ParticleDesignerDocument_Ffi.get_finishColorVarianceBlue(this);

	inline function set_finishColorVarianceBlue(value:Single):Single { ParticleDesignerDocument_Ffi.set_finishColorVarianceBlue(this, value); return value; }
	public var finishColorVarianceGreen(get, set):Single;

	inline function get_finishColorVarianceGreen():Single return ParticleDesignerDocument_Ffi.get_finishColorVarianceGreen(this);

	inline function set_finishColorVarianceGreen(value:Single):Single { ParticleDesignerDocument_Ffi.set_finishColorVarianceGreen(this, value); return value; }
	public var finishColorVarianceRed(get, set):Single;

	inline function get_finishColorVarianceRed():Single return ParticleDesignerDocument_Ffi.get_finishColorVarianceRed(this);

	inline function set_finishColorVarianceRed(value:Single):Single { ParticleDesignerDocument_Ffi.set_finishColorVarianceRed(this, value); return value; }
	public var finishParticleSize(get, set):Single;

	inline function get_finishParticleSize():Single return ParticleDesignerDocument_Ffi.get_finishParticleSize(this);

	inline function set_finishParticleSize(value:Single):Single { ParticleDesignerDocument_Ffi.set_finishParticleSize(this, value); return value; }
	public var finishParticleSizeVariance(get, set):Single;

	inline function get_finishParticleSizeVariance():Single return ParticleDesignerDocument_Ffi.get_finishParticleSizeVariance(this);

	inline function set_finishParticleSizeVariance(value:Single):Single { ParticleDesignerDocument_Ffi.set_finishParticleSizeVariance(this, value); return value; }
	public var gravityx(get, set):Single;

	inline function get_gravityx():Single return ParticleDesignerDocument_Ffi.get_gravityx(this);

	inline function set_gravityx(value:Single):Single { ParticleDesignerDocument_Ffi.set_gravityx(this, value); return value; }
	public var gravityy(get, set):Single;

	inline function get_gravityy():Single return ParticleDesignerDocument_Ffi.get_gravityy(this);

	inline function set_gravityy(value:Single):Single { ParticleDesignerDocument_Ffi.set_gravityy(this, value); return value; }
	public var maxParticles(get, set):Single;

	inline function get_maxParticles():Single return ParticleDesignerDocument_Ffi.get_maxParticles(this);

	inline function set_maxParticles(value:Single):Single { ParticleDesignerDocument_Ffi.set_maxParticles(this, value); return value; }
	public var maxRadius(get, set):Single;

	inline function get_maxRadius():Single return ParticleDesignerDocument_Ffi.get_maxRadius(this);

	inline function set_maxRadius(value:Single):Single { ParticleDesignerDocument_Ffi.set_maxRadius(this, value); return value; }
	public var maxRadiusVariance(get, set):Single;

	inline function get_maxRadiusVariance():Single return ParticleDesignerDocument_Ffi.get_maxRadiusVariance(this);

	inline function set_maxRadiusVariance(value:Single):Single { ParticleDesignerDocument_Ffi.set_maxRadiusVariance(this, value); return value; }
	public var minRadius(get, set):Single;

	inline function get_minRadius():Single return ParticleDesignerDocument_Ffi.get_minRadius(this);

	inline function set_minRadius(value:Single):Single { ParticleDesignerDocument_Ffi.set_minRadius(this, value); return value; }
	public var minRadiusVariance(get, set):Single;

	inline function get_minRadiusVariance():Single return ParticleDesignerDocument_Ffi.get_minRadiusVariance(this);

	inline function set_minRadiusVariance(value:Single):Single { ParticleDesignerDocument_Ffi.set_minRadiusVariance(this, value); return value; }
	public var particleLifespan(get, set):Single;

	inline function get_particleLifespan():Single return ParticleDesignerDocument_Ffi.get_particleLifespan(this);

	inline function set_particleLifespan(value:Single):Single { ParticleDesignerDocument_Ffi.set_particleLifespan(this, value); return value; }
	public var particleLifespanVariance(get, set):Single;

	inline function get_particleLifespanVariance():Single return ParticleDesignerDocument_Ffi.get_particleLifespanVariance(this);

	inline function set_particleLifespanVariance(value:Single):Single { ParticleDesignerDocument_Ffi.set_particleLifespanVariance(this, value); return value; }
	public var rotatePerSecond(get, set):Single;

	inline function get_rotatePerSecond():Single return ParticleDesignerDocument_Ffi.get_rotatePerSecond(this);

	inline function set_rotatePerSecond(value:Single):Single { ParticleDesignerDocument_Ffi.set_rotatePerSecond(this, value); return value; }
	public var rotatePerSecondVariance(get, set):Single;

	inline function get_rotatePerSecondVariance():Single return ParticleDesignerDocument_Ffi.get_rotatePerSecondVariance(this);

	inline function set_rotatePerSecondVariance(value:Single):Single { ParticleDesignerDocument_Ffi.set_rotatePerSecondVariance(this, value); return value; }
	public var rotationEnd(get, set):Single;

	inline function get_rotationEnd():Single return ParticleDesignerDocument_Ffi.get_rotationEnd(this);

	inline function set_rotationEnd(value:Single):Single { ParticleDesignerDocument_Ffi.set_rotationEnd(this, value); return value; }
	public var rotationEndVariance(get, set):Single;

	inline function get_rotationEndVariance():Single return ParticleDesignerDocument_Ffi.get_rotationEndVariance(this);

	inline function set_rotationEndVariance(value:Single):Single { ParticleDesignerDocument_Ffi.set_rotationEndVariance(this, value); return value; }
	public var rotationStart(get, set):Single;

	inline function get_rotationStart():Single return ParticleDesignerDocument_Ffi.get_rotationStart(this);

	inline function set_rotationStart(value:Single):Single { ParticleDesignerDocument_Ffi.set_rotationStart(this, value); return value; }
	public var rotationStartVariance(get, set):Single;

	inline function get_rotationStartVariance():Single return ParticleDesignerDocument_Ffi.get_rotationStartVariance(this);

	inline function set_rotationStartVariance(value:Single):Single { ParticleDesignerDocument_Ffi.set_rotationStartVariance(this, value); return value; }
	public var sourcePositionVariancex(get, set):Single;

	inline function get_sourcePositionVariancex():Single return ParticleDesignerDocument_Ffi.get_sourcePositionVariancex(this);

	inline function set_sourcePositionVariancex(value:Single):Single { ParticleDesignerDocument_Ffi.set_sourcePositionVariancex(this, value); return value; }
	public var sourcePositionVariancey(get, set):Single;

	inline function get_sourcePositionVariancey():Single return ParticleDesignerDocument_Ffi.get_sourcePositionVariancey(this);

	inline function set_sourcePositionVariancey(value:Single):Single { ParticleDesignerDocument_Ffi.set_sourcePositionVariancey(this, value); return value; }
	public var speed(get, set):Single;

	inline function get_speed():Single return ParticleDesignerDocument_Ffi.get_speed(this);

	inline function set_speed(value:Single):Single { ParticleDesignerDocument_Ffi.set_speed(this, value); return value; }
	public var speedVariance(get, set):Single;

	inline function get_speedVariance():Single return ParticleDesignerDocument_Ffi.get_speedVariance(this);

	inline function set_speedVariance(value:Single):Single { ParticleDesignerDocument_Ffi.set_speedVariance(this, value); return value; }
	public var startColorAlpha(get, set):Single;

	inline function get_startColorAlpha():Single return ParticleDesignerDocument_Ffi.get_startColorAlpha(this);

	inline function set_startColorAlpha(value:Single):Single { ParticleDesignerDocument_Ffi.set_startColorAlpha(this, value); return value; }
	public var startColorBlue(get, set):Single;

	inline function get_startColorBlue():Single return ParticleDesignerDocument_Ffi.get_startColorBlue(this);

	inline function set_startColorBlue(value:Single):Single { ParticleDesignerDocument_Ffi.set_startColorBlue(this, value); return value; }
	public var startColorGreen(get, set):Single;

	inline function get_startColorGreen():Single return ParticleDesignerDocument_Ffi.get_startColorGreen(this);

	inline function set_startColorGreen(value:Single):Single { ParticleDesignerDocument_Ffi.set_startColorGreen(this, value); return value; }
	public var startColorRed(get, set):Single;

	inline function get_startColorRed():Single return ParticleDesignerDocument_Ffi.get_startColorRed(this);

	inline function set_startColorRed(value:Single):Single { ParticleDesignerDocument_Ffi.set_startColorRed(this, value); return value; }
	public var startColorVarianceAlpha(get, set):Single;

	inline function get_startColorVarianceAlpha():Single return ParticleDesignerDocument_Ffi.get_startColorVarianceAlpha(this);

	inline function set_startColorVarianceAlpha(value:Single):Single { ParticleDesignerDocument_Ffi.set_startColorVarianceAlpha(this, value); return value; }
	public var startColorVarianceBlue(get, set):Single;

	inline function get_startColorVarianceBlue():Single return ParticleDesignerDocument_Ffi.get_startColorVarianceBlue(this);

	inline function set_startColorVarianceBlue(value:Single):Single { ParticleDesignerDocument_Ffi.set_startColorVarianceBlue(this, value); return value; }
	public var startColorVarianceGreen(get, set):Single;

	inline function get_startColorVarianceGreen():Single return ParticleDesignerDocument_Ffi.get_startColorVarianceGreen(this);

	inline function set_startColorVarianceGreen(value:Single):Single { ParticleDesignerDocument_Ffi.set_startColorVarianceGreen(this, value); return value; }
	public var startColorVarianceRed(get, set):Single;

	inline function get_startColorVarianceRed():Single return ParticleDesignerDocument_Ffi.get_startColorVarianceRed(this);

	inline function set_startColorVarianceRed(value:Single):Single { ParticleDesignerDocument_Ffi.set_startColorVarianceRed(this, value); return value; }
	public var startParticleSize(get, set):Single;

	inline function get_startParticleSize():Single return ParticleDesignerDocument_Ffi.get_startParticleSize(this);

	inline function set_startParticleSize(value:Single):Single { ParticleDesignerDocument_Ffi.set_startParticleSize(this, value); return value; }
	public var startParticleSizeVariance(get, set):Single;

	inline function get_startParticleSizeVariance():Single return ParticleDesignerDocument_Ffi.get_startParticleSizeVariance(this);

	inline function set_startParticleSizeVariance(value:Single):Single { ParticleDesignerDocument_Ffi.set_startParticleSizeVariance(this, value); return value; }
	public var textureFileName(get, set):String;
	inline function get_textureFileName():String { var raw = ParticleDesignerDocument_Ffi.get_textureFileName(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ParticleDesignerDocument_Ffi.freeString(raw); return value; }
	inline function set_textureFileName(value:String):String { var raw:cpp.ConstCharStar = cast value; ParticleDesignerDocument_Ffi.set_textureFileName(this, raw); return value; }
}

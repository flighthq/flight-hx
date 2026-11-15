package flight._cpp;

private extern class AreaLight_Ffi {
	@:native("flight_get_area_light_casts_shadow") static function get_castsShadow(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_area_light_casts_shadow") static function set_castsShadow(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_area_light_color") static function get_color(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_area_light_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_area_light_decay") static function get_decay(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_area_light_decay") static function set_decay(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_area_light_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_area_light_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_area_light_intensity") static function get_intensity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_area_light_intensity") static function set_intensity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_area_light_normal_bias") static function get_normalBias(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_area_light_normal_bias") static function set_normalBias(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_area_light_pcf_radius") static function get_pcfRadius(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_area_light_pcf_radius") static function set_pcfRadius(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_area_light_range") static function get_range(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_area_light_range") static function set_range(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_area_light_shadow_bias") static function get_shadowBias(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_area_light_shadow_bias") static function set_shadowBias(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_area_light_shadow_far") static function get_shadowFar(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_area_light_shadow_far") static function set_shadowFar(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_area_light_shadow_map_size") static function get_shadowMapSize(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_area_light_shadow_map_size") static function set_shadowMapSize(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_area_light_shadow_near") static function get_shadowNear(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_area_light_shadow_near") static function set_shadowNear(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_area_light_shadow_strength") static function get_shadowStrength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_area_light_shadow_strength") static function set_shadowStrength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract AreaLight(cpp.Star<cpp.Void>) {
	public var castsShadow(get, set):Bool;

	inline function get_castsShadow():Bool return AreaLight_Ffi.get_castsShadow(this);

	inline function set_castsShadow(value:Bool):Bool return AreaLight_Ffi.set_castsShadow(this, value);
	public var color(get, set):Int;

	inline function get_color():Int return AreaLight_Ffi.get_color(this);

	inline function set_color(value:Int):Int return AreaLight_Ffi.set_color(this, value);
	public var decay(get, set):Single;

	inline function get_decay():Single return AreaLight_Ffi.get_decay(this);

	inline function set_decay(value:Single):Single return AreaLight_Ffi.set_decay(this, value);
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return AreaLight_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return AreaLight_Ffi.set_enabled(this, value);
	public var intensity(get, set):Single;

	inline function get_intensity():Single return AreaLight_Ffi.get_intensity(this);

	inline function set_intensity(value:Single):Single return AreaLight_Ffi.set_intensity(this, value);
	public var normalBias(get, set):Single;

	inline function get_normalBias():Single return AreaLight_Ffi.get_normalBias(this);

	inline function set_normalBias(value:Single):Single return AreaLight_Ffi.set_normalBias(this, value);
	public var pcfRadius(get, set):Single;

	inline function get_pcfRadius():Single return AreaLight_Ffi.get_pcfRadius(this);

	inline function set_pcfRadius(value:Single):Single return AreaLight_Ffi.set_pcfRadius(this, value);
	public var range(get, set):Single;

	inline function get_range():Single return AreaLight_Ffi.get_range(this);

	inline function set_range(value:Single):Single return AreaLight_Ffi.set_range(this, value);
	public var shadowBias(get, set):Single;

	inline function get_shadowBias():Single return AreaLight_Ffi.get_shadowBias(this);

	inline function set_shadowBias(value:Single):Single return AreaLight_Ffi.set_shadowBias(this, value);
	public var shadowFar(get, set):Single;

	inline function get_shadowFar():Single return AreaLight_Ffi.get_shadowFar(this);

	inline function set_shadowFar(value:Single):Single return AreaLight_Ffi.set_shadowFar(this, value);
	public var shadowMapSize(get, set):Int;

	inline function get_shadowMapSize():Int return AreaLight_Ffi.get_shadowMapSize(this);

	inline function set_shadowMapSize(value:Int):Int return AreaLight_Ffi.set_shadowMapSize(this, value);
	public var shadowNear(get, set):Single;

	inline function get_shadowNear():Single return AreaLight_Ffi.get_shadowNear(this);

	inline function set_shadowNear(value:Single):Single return AreaLight_Ffi.set_shadowNear(this, value);
	public var shadowStrength(get, set):Single;

	inline function get_shadowStrength():Single return AreaLight_Ffi.get_shadowStrength(this);

	inline function set_shadowStrength(value:Single):Single return AreaLight_Ffi.set_shadowStrength(this, value);
}

package flight._cpp;

private extern class DirectionalLight_Ffi {
	@:native("flight_get_directional_light_cascade_count") static function get_cascadeCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_directional_light_cascade_count") static function set_cascadeCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_directional_light_casts_shadow") static function get_castsShadow(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_directional_light_casts_shadow") static function set_castsShadow(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_directional_light_color") static function get_color(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_directional_light_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_directional_light_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_directional_light_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_directional_light_intensity") static function get_intensity(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_directional_light_intensity") static function set_intensity(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_directional_light_normal_bias") static function get_normalBias(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_directional_light_normal_bias") static function set_normalBias(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_directional_light_pcf_radius") static function get_pcfRadius(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_directional_light_pcf_radius") static function set_pcfRadius(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_directional_light_shadow_bias") static function get_shadowBias(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_directional_light_shadow_bias") static function set_shadowBias(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_directional_light_shadow_far") static function get_shadowFar(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_directional_light_shadow_far") static function set_shadowFar(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_directional_light_shadow_map_size") static function get_shadowMapSize(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_directional_light_shadow_map_size") static function set_shadowMapSize(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_directional_light_shadow_near") static function get_shadowNear(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_directional_light_shadow_near") static function set_shadowNear(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_directional_light_shadow_strength") static function get_shadowStrength(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_directional_light_shadow_strength") static function set_shadowStrength(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract DirectionalLight(cpp.Star<cpp.Void>) {
	public var cascadeCount(get, set):Int;

	inline function get_cascadeCount():Int return DirectionalLight_Ffi.get_cascadeCount(this);

	inline function set_cascadeCount(value:Int):Int { DirectionalLight_Ffi.set_cascadeCount(this, value); return value; }
	public var castsShadow(get, set):Bool;

	inline function get_castsShadow():Bool return DirectionalLight_Ffi.get_castsShadow(this);

	inline function set_castsShadow(value:Bool):Bool { DirectionalLight_Ffi.set_castsShadow(this, value); return value; }
	public var color(get, set):Int;

	inline function get_color():Int return DirectionalLight_Ffi.get_color(this);

	inline function set_color(value:Int):Int { DirectionalLight_Ffi.set_color(this, value); return value; }
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return DirectionalLight_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { DirectionalLight_Ffi.set_enabled(this, value); return value; }
	public var intensity(get, set):Float;

	inline function get_intensity():Float return DirectionalLight_Ffi.get_intensity(this);

	inline function set_intensity(value:Float):Float { DirectionalLight_Ffi.set_intensity(this, value); return value; }
	public var normalBias(get, set):Float;

	inline function get_normalBias():Float return DirectionalLight_Ffi.get_normalBias(this);

	inline function set_normalBias(value:Float):Float { DirectionalLight_Ffi.set_normalBias(this, value); return value; }
	public var pcfRadius(get, set):Float;

	inline function get_pcfRadius():Float return DirectionalLight_Ffi.get_pcfRadius(this);

	inline function set_pcfRadius(value:Float):Float { DirectionalLight_Ffi.set_pcfRadius(this, value); return value; }
	public var shadowBias(get, set):Float;

	inline function get_shadowBias():Float return DirectionalLight_Ffi.get_shadowBias(this);

	inline function set_shadowBias(value:Float):Float { DirectionalLight_Ffi.set_shadowBias(this, value); return value; }
	public var shadowFar(get, set):Float;

	inline function get_shadowFar():Float return DirectionalLight_Ffi.get_shadowFar(this);

	inline function set_shadowFar(value:Float):Float { DirectionalLight_Ffi.set_shadowFar(this, value); return value; }
	public var shadowMapSize(get, set):Int;

	inline function get_shadowMapSize():Int return DirectionalLight_Ffi.get_shadowMapSize(this);

	inline function set_shadowMapSize(value:Int):Int { DirectionalLight_Ffi.set_shadowMapSize(this, value); return value; }
	public var shadowNear(get, set):Float;

	inline function get_shadowNear():Float return DirectionalLight_Ffi.get_shadowNear(this);

	inline function set_shadowNear(value:Float):Float { DirectionalLight_Ffi.set_shadowNear(this, value); return value; }
	public var shadowStrength(get, set):Float;

	inline function get_shadowStrength():Float return DirectionalLight_Ffi.get_shadowStrength(this);

	inline function set_shadowStrength(value:Float):Float { DirectionalLight_Ffi.set_shadowStrength(this, value); return value; }
}

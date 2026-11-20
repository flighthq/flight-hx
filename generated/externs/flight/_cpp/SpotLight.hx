package flight._cpp;

private extern class SpotLight_Ffi {
	@:native("flight_get_spot_light_casts_shadow") static function get_castsShadow(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_spot_light_casts_shadow") static function set_castsShadow(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_spot_light_color") static function get_color(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_spot_light_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_spot_light_decay") static function get_decay(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spot_light_decay") static function set_decay(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spot_light_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_spot_light_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_spot_light_inner_cone_cos") static function get_innerConeCos(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spot_light_inner_cone_cos") static function set_innerConeCos(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spot_light_intensity") static function get_intensity(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spot_light_intensity") static function set_intensity(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spot_light_layer_mask") static function get_layerMask(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_spot_light_layer_mask") static function set_layerMask(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_spot_light_priority") static function get_priority(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spot_light_priority") static function set_priority(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spot_light_normal_bias") static function get_normalBias(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spot_light_normal_bias") static function set_normalBias(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spot_light_outer_cone_cos") static function get_outerConeCos(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spot_light_outer_cone_cos") static function set_outerConeCos(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spot_light_pcf_radius") static function get_pcfRadius(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spot_light_pcf_radius") static function set_pcfRadius(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spot_light_range") static function get_range(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spot_light_range") static function set_range(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spot_light_shadow_bias") static function get_shadowBias(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spot_light_shadow_bias") static function set_shadowBias(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spot_light_shadow_far") static function get_shadowFar(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spot_light_shadow_far") static function set_shadowFar(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spot_light_shadow_map_size") static function get_shadowMapSize(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_spot_light_shadow_map_size") static function set_shadowMapSize(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_spot_light_shadow_near") static function get_shadowNear(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spot_light_shadow_near") static function set_shadowNear(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spot_light_shadow_strength") static function get_shadowStrength(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spot_light_shadow_strength") static function set_shadowStrength(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spot_light_spot_blend") static function get_spotBlend(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spot_light_spot_blend") static function set_spotBlend(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract SpotLight(cpp.Star<cpp.Void>) {
	public var castsShadow(get, set):Bool;

	inline function get_castsShadow():Bool return SpotLight_Ffi.get_castsShadow(this);

	inline function set_castsShadow(value:Bool):Bool { SpotLight_Ffi.set_castsShadow(this, value); return value; }
	public var color(get, set):Int;

	inline function get_color():Int return SpotLight_Ffi.get_color(this);

	inline function set_color(value:Int):Int { SpotLight_Ffi.set_color(this, value); return value; }
	public var decay(get, set):Float;

	inline function get_decay():Float return SpotLight_Ffi.get_decay(this);

	inline function set_decay(value:Float):Float { SpotLight_Ffi.set_decay(this, value); return value; }
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return SpotLight_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { SpotLight_Ffi.set_enabled(this, value); return value; }
	public var innerConeCos(get, set):Float;

	inline function get_innerConeCos():Float return SpotLight_Ffi.get_innerConeCos(this);

	inline function set_innerConeCos(value:Float):Float { SpotLight_Ffi.set_innerConeCos(this, value); return value; }
	public var intensity(get, set):Float;

	inline function get_intensity():Float return SpotLight_Ffi.get_intensity(this);

	inline function set_intensity(value:Float):Float { SpotLight_Ffi.set_intensity(this, value); return value; }
	public var layerMask(get, set):Int;

	inline function get_layerMask():Int return SpotLight_Ffi.get_layerMask(this);

	inline function set_layerMask(value:Int):Int { SpotLight_Ffi.set_layerMask(this, value); return value; }
	public var priority(get, set):Float;

	inline function get_priority():Float return SpotLight_Ffi.get_priority(this);

	inline function set_priority(value:Float):Float { SpotLight_Ffi.set_priority(this, value); return value; }
	public var normalBias(get, set):Float;

	inline function get_normalBias():Float return SpotLight_Ffi.get_normalBias(this);

	inline function set_normalBias(value:Float):Float { SpotLight_Ffi.set_normalBias(this, value); return value; }
	public var outerConeCos(get, set):Float;

	inline function get_outerConeCos():Float return SpotLight_Ffi.get_outerConeCos(this);

	inline function set_outerConeCos(value:Float):Float { SpotLight_Ffi.set_outerConeCos(this, value); return value; }
	public var pcfRadius(get, set):Float;

	inline function get_pcfRadius():Float return SpotLight_Ffi.get_pcfRadius(this);

	inline function set_pcfRadius(value:Float):Float { SpotLight_Ffi.set_pcfRadius(this, value); return value; }
	public var range(get, set):Float;

	inline function get_range():Float return SpotLight_Ffi.get_range(this);

	inline function set_range(value:Float):Float { SpotLight_Ffi.set_range(this, value); return value; }
	public var shadowBias(get, set):Float;

	inline function get_shadowBias():Float return SpotLight_Ffi.get_shadowBias(this);

	inline function set_shadowBias(value:Float):Float { SpotLight_Ffi.set_shadowBias(this, value); return value; }
	public var shadowFar(get, set):Float;

	inline function get_shadowFar():Float return SpotLight_Ffi.get_shadowFar(this);

	inline function set_shadowFar(value:Float):Float { SpotLight_Ffi.set_shadowFar(this, value); return value; }
	public var shadowMapSize(get, set):Int;

	inline function get_shadowMapSize():Int return SpotLight_Ffi.get_shadowMapSize(this);

	inline function set_shadowMapSize(value:Int):Int { SpotLight_Ffi.set_shadowMapSize(this, value); return value; }
	public var shadowNear(get, set):Float;

	inline function get_shadowNear():Float return SpotLight_Ffi.get_shadowNear(this);

	inline function set_shadowNear(value:Float):Float { SpotLight_Ffi.set_shadowNear(this, value); return value; }
	public var shadowStrength(get, set):Float;

	inline function get_shadowStrength():Float return SpotLight_Ffi.get_shadowStrength(this);

	inline function set_shadowStrength(value:Float):Float { SpotLight_Ffi.set_shadowStrength(this, value); return value; }
	public var spotBlend(get, set):Float;

	inline function get_spotBlend():Float return SpotLight_Ffi.get_spotBlend(this);

	inline function set_spotBlend(value:Float):Float { SpotLight_Ffi.set_spotBlend(this, value); return value; }
}

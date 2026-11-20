package flight._cpp;

private extern class Environment_Ffi {
	@:native("flight_get_environment_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_environment_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_environment_intensity") static function get_intensity(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_environment_intensity") static function set_intensity(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Environment(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return Environment_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { Environment_Ffi.set_enabled(this, value); return value; }
	public var intensity(get, set):Float;

	inline function get_intensity():Float return Environment_Ffi.get_intensity(this);

	inline function set_intensity(value:Float):Float { Environment_Ffi.set_intensity(this, value); return value; }

	static extern inline public function create():flight._cpp.Environment {
		return flight._cpp._fn.Lighting.createEnvironment();
	}
	extern inline public function clone():flight._cpp.Environment {
		return flight._cpp._fn.Lighting.cloneEnvironment(cast this);
	}
	extern inline public function getLightInfluenceBounds(out:flight._cpp.BoundingSphere):Void {
		flight._cpp._fn.Lighting.getLightInfluenceBoundsEnvironment(out, cast this);
	}
	extern inline public function getLightLuminance():Float {
		return flight._cpp._fn.Lighting.getLightLuminanceEnvironment(cast this);
	}
	extern inline public function hasLightInfluenceOnBounds(bounds:flight._cpp.BoundingSphere):Bool {
		return flight._cpp._fn.Lighting.hasLightInfluenceOnBoundsEnvironment(cast this, bounds);
	}
	extern inline public function isLightCastingShadow():Bool {
		return flight._cpp._fn.Lighting.isLightCastingShadowEnvironment(cast this);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Lighting.freeEnvironment(cast this);
	}
}

package flight._js;

@:jsRequire("flight")
private extern class Environment_Ffi {
	@:native("flight_get_environment_enabled") static function get_enabled(ptr:Dynamic):Bool;
	@:native("flight_set_environment_enabled") static function set_enabled(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_environment_intensity") static function get_intensity(ptr:Dynamic):Float;
	@:native("flight_set_environment_intensity") static function set_intensity(ptr:Dynamic, value:Float):Float;
}

abstract Environment(Dynamic) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return Environment_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return Environment_Ffi.set_enabled(this, value);
	public var intensity(get, set):Float;

	inline function get_intensity():Float return Environment_Ffi.get_intensity(this);

	inline function set_intensity(value:Float):Float return Environment_Ffi.set_intensity(this, value);

	static inline public function create():flight._js.Environment {
		return flight._js._fn.Lighting.createEnvironment();
	}
	inline public function clone():flight._js.Environment {
		return flight._js._fn.Lighting.cloneEnvironment(cast this);
	}
	inline public function getLightInfluenceBounds(out:flight._js.BoundingSphere):Void {
		flight._js._fn.Lighting.getLightInfluenceBoundsEnvironment(out, cast this);
	}
	inline public function getLightLuminance():Float {
		return flight._js._fn.Lighting.getLightLuminanceEnvironment(cast this);
	}
	inline public function hasLightInfluenceOnBounds(bounds:flight._js.BoundingSphere):Bool {
		return flight._js._fn.Lighting.hasLightInfluenceOnBoundsEnvironment(cast this, bounds);
	}
	inline public function isLightCastingShadow():Bool {
		return flight._js._fn.Lighting.isLightCastingShadowEnvironment(cast this);
	}
	inline public function free():Void {
		flight._js._fn.Lighting.freeEnvironment(cast this);
	}
}

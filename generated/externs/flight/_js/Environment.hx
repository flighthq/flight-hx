package flight._js;

abstract Environment(Dynamic) {
	public var enabled(get, set):Bool;
	inline function get_enabled():Bool return untyped this["enabled"];
	inline function set_enabled(value:Bool):Bool return untyped this["enabled"] = value;
	public var intensity(get, set):Float;
	inline function get_intensity():Float return untyped this["intensity"];
	inline function set_intensity(value:Float):Float return untyped this["intensity"] = value;
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

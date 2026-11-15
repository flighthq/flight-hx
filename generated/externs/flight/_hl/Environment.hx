package flight._hl;

abstract Environment(hl.Bytes) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(16) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(16, value ? 1 : 0); return value; }
	public var intensity(get, set):Single;

	inline function get_intensity():Single return this.getF32(32);

	inline function set_intensity(value:Single):Single { this.setF32(32, value); return value; }

	static inline public function create():flight._hl.Environment {
		return flight._hl._fn.Lighting.createEnvironment();
	}
	inline public function clone():flight._hl.Environment {
		return flight._hl._fn.Lighting.cloneEnvironment(cast this);
	}
	inline public function getLightInfluenceBounds(out:flight._hl.BoundingSphere):Void {
		flight._hl._fn.Lighting.getLightInfluenceBoundsEnvironment(out, cast this);
	}
	inline public function getLightLuminance():Single {
		return flight._hl._fn.Lighting.getLightLuminanceEnvironment(cast this);
	}
	inline public function hasLightInfluenceOnBounds(bounds:flight._hl.BoundingSphere):Bool {
		return flight._hl._fn.Lighting.hasLightInfluenceOnBoundsEnvironment(cast this, bounds);
	}
	inline public function isLightCastingShadow():Bool {
		return flight._hl._fn.Lighting.isLightCastingShadowEnvironment(cast this);
	}
	inline public function free():Void {
		flight._hl._fn.Lighting.freeEnvironment(cast this);
	}
}

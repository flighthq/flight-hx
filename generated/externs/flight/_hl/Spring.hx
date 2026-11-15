package flight._hl;

abstract Spring(hl.Bytes) {
	public var value(get, set):Single;

	inline function get_value():Single return this.getF32(0);

	inline function set_value(value:Single):Single { this.setF32(0, value); return value; }
	public var velocity(get, set):Single;

	inline function get_velocity():Single return this.getF32(4);

	inline function set_velocity(value:Single):Single { this.setF32(4, value); return value; }

	static inline public function create(value:Single, velocity:Single):flight._hl.Spring {
		return flight._hl._fn.Spring.createSpring(value, velocity);
	}
	inline public function addImpulse(velocity:Single):Void {
		flight._hl._fn.Spring.addSpringImpulse(cast this, velocity);
	}
	inline public function isSettled(target:Single, positionEpsilon:Single, velocityEpsilon:Single):Bool {
		return flight._hl._fn.Spring.isSpringSettled(cast this, target, positionEpsilon, velocityEpsilon);
	}
	inline public function reset(value:Single, velocity:Single):Void {
		flight._hl._fn.Spring.resetSpring(cast this, value, velocity);
	}
	inline public function update(target:Single, config:flight._hl.SpringConfig, deltaTime:Single):Void {
		flight._hl._fn.Spring.updateSpring(cast this, target, config, deltaTime);
	}
	inline public function updateAngle(target:Single, fullTurn:Single, config:flight._hl.SpringConfig, deltaTime:Single):Void {
		flight._hl._fn.Spring.updateSpringAngle(cast this, target, fullTurn, config, deltaTime);
	}
	inline public function free():Void {
		flight._hl._fn.Spring.freeSpring(cast this);
	}
}

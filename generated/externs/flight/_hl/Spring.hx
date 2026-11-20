package flight._hl;

abstract Spring(hl.Bytes) {
	public var value(get, set):Float;

	inline function get_value():Float return this.getF64(0);

	inline function set_value(value:Float):Float { this.setF64(0, value); return value; }
	public var velocity(get, set):Float;

	inline function get_velocity():Float return this.getF64(8);

	inline function set_velocity(value:Float):Float { this.setF64(8, value); return value; }

	static inline public function create(value:Float, velocity:Float):flight._hl.Spring {
		return flight._hl._fn.Spring.createSpring(value, velocity);
	}
	inline public function addImpulse(velocity:Float):Void {
		flight._hl._fn.Spring.addSpringImpulse(cast this, velocity);
	}
	inline public function isSettled(target:Float, positionEpsilon:Float, velocityEpsilon:Float):Bool {
		return flight._hl._fn.Spring.isSpringSettled(cast this, target, positionEpsilon, velocityEpsilon);
	}
	inline public function reset(value:Float, velocity:Float):Void {
		flight._hl._fn.Spring.resetSpring(cast this, value, velocity);
	}
	inline public function update(target:Float, config:flight._hl.SpringConfig, deltaTime:Float):Void {
		flight._hl._fn.Spring.updateSpring(cast this, target, config, deltaTime);
	}
	inline public function updateAngle(target:Float, fullTurn:Float, config:flight._hl.SpringConfig, deltaTime:Float):Void {
		flight._hl._fn.Spring.updateSpringAngle(cast this, target, fullTurn, config, deltaTime);
	}
	inline public function free():Void {
		flight._hl._fn.Spring.freeSpring(cast this);
	}
}

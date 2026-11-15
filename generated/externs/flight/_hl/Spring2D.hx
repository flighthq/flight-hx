package flight._hl;

abstract Spring2D(hl.Bytes) {
	static inline public function create(valueX:Single, valueY:Single, velocityX:Single, velocityY:Single):flight._hl.Spring2D {
		return flight._hl._fn.Spring.createSpring2d(valueX, valueY, velocityX, velocityY);
	}
	inline public function isSettled(targetX:Single, targetY:Single, positionEpsilon:Single, velocityEpsilon:Single):Bool {
		return flight._hl._fn.Spring.isSpring2dSettled(cast this, targetX, targetY, positionEpsilon, velocityEpsilon);
	}
	inline public function reset(valueX:Single, valueY:Single, velocityX:Single, velocityY:Single):Void {
		flight._hl._fn.Spring.resetSpring2d(cast this, valueX, valueY, velocityX, velocityY);
	}
	inline public function update(targetX:Single, targetY:Single, config:flight._hl.SpringConfig, deltaTime:Single):Void {
		flight._hl._fn.Spring.updateSpring2d(cast this, targetX, targetY, config, deltaTime);
	}
}

package flight._hl;

abstract Spring3D(hl.Bytes) {
	static inline public function create(valueX:Single, valueY:Single, valueZ:Single, velocityX:Single, velocityY:Single, velocityZ:Single):flight._hl.Spring3D {
		return flight._hl._fn.Spring.createSpring3d(valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
	}
	inline public function isSettled(targetX:Single, targetY:Single, targetZ:Single, positionEpsilon:Single, velocityEpsilon:Single):Bool {
		return flight._hl._fn.Spring.isSpring3dSettled(cast this, targetX, targetY, targetZ, positionEpsilon, velocityEpsilon);
	}
	inline public function reset(valueX:Single, valueY:Single, valueZ:Single, velocityX:Single, velocityY:Single, velocityZ:Single):Void {
		flight._hl._fn.Spring.resetSpring3d(cast this, valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
	}
	inline public function update(targetX:Single, targetY:Single, targetZ:Single, config:flight._hl.SpringConfig, deltaTime:Single):Void {
		flight._hl._fn.Spring.updateSpring3d(cast this, targetX, targetY, targetZ, config, deltaTime);
	}
}

package flight._hl;

abstract Spring3D(hl.Bytes) {
	static inline public function create(valueX:Float, valueY:Float, valueZ:Float, velocityX:Float, velocityY:Float, velocityZ:Float):flight._hl.Spring3D {
		return flight._hl._fn.Spring.createSpring3d(valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
	}
	inline public function isSettled(targetX:Float, targetY:Float, targetZ:Float, positionEpsilon:Float, velocityEpsilon:Float):Bool {
		return flight._hl._fn.Spring.isSpring3dSettled(cast this, targetX, targetY, targetZ, positionEpsilon, velocityEpsilon);
	}
	inline public function reset(valueX:Float, valueY:Float, valueZ:Float, velocityX:Float, velocityY:Float, velocityZ:Float):Void {
		flight._hl._fn.Spring.resetSpring3d(cast this, valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
	}
	inline public function update(targetX:Float, targetY:Float, targetZ:Float, config:flight._hl.SpringConfig, deltaTime:Float):Void {
		flight._hl._fn.Spring.updateSpring3d(cast this, targetX, targetY, targetZ, config, deltaTime);
	}
}

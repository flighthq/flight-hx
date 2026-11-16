package flight._cpp;

abstract Spring3D(cpp.Star<cpp.Void>) {
	static extern inline public function create(valueX:Single, valueY:Single, valueZ:Single, velocityX:Single, velocityY:Single, velocityZ:Single):flight._cpp.Spring3D {
		return flight._cpp._fn.Spring.createSpring3d(valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
	}
	extern inline public function isSettled(targetX:Single, targetY:Single, targetZ:Single, positionEpsilon:Single, velocityEpsilon:Single):Bool {
		return flight._cpp._fn.Spring.isSpring3dSettled(cast this, targetX, targetY, targetZ, positionEpsilon, velocityEpsilon);
	}
	extern inline public function reset(valueX:Single, valueY:Single, valueZ:Single, velocityX:Single, velocityY:Single, velocityZ:Single):Void {
		flight._cpp._fn.Spring.resetSpring3d(cast this, valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
	}
	extern inline public function update(targetX:Single, targetY:Single, targetZ:Single, config:flight._cpp.SpringConfig, deltaTime:Single):Void {
		flight._cpp._fn.Spring.updateSpring3d(cast this, targetX, targetY, targetZ, config, deltaTime);
	}
}

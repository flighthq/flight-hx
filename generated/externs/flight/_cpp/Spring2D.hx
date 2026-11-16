package flight._cpp;

abstract Spring2D(cpp.Star<cpp.Void>) {
	static extern inline public function create(valueX:Single, valueY:Single, velocityX:Single, velocityY:Single):flight._cpp.Spring2D {
		return flight._cpp._fn.Spring.createSpring2d(valueX, valueY, velocityX, velocityY);
	}
	extern inline public function isSettled(targetX:Single, targetY:Single, positionEpsilon:Single, velocityEpsilon:Single):Bool {
		return flight._cpp._fn.Spring.isSpring2dSettled(cast this, targetX, targetY, positionEpsilon, velocityEpsilon);
	}
	extern inline public function reset(valueX:Single, valueY:Single, velocityX:Single, velocityY:Single):Void {
		flight._cpp._fn.Spring.resetSpring2d(cast this, valueX, valueY, velocityX, velocityY);
	}
	extern inline public function update(targetX:Single, targetY:Single, config:flight._cpp.SpringConfig, deltaTime:Single):Void {
		flight._cpp._fn.Spring.updateSpring2d(cast this, targetX, targetY, config, deltaTime);
	}
}

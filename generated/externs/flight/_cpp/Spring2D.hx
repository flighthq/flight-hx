package flight._cpp;

abstract Spring2D(cpp.Star<cpp.Void>) {
	static extern inline public function create(valueX:Float, valueY:Float, velocityX:Float, velocityY:Float):flight._cpp.Spring2D {
		return flight._cpp._fn.Spring.createSpring2d(valueX, valueY, velocityX, velocityY);
	}
	extern inline public function isSettled(targetX:Float, targetY:Float, positionEpsilon:Float, velocityEpsilon:Float):Bool {
		return flight._cpp._fn.Spring.isSpring2dSettled(cast this, targetX, targetY, positionEpsilon, velocityEpsilon);
	}
	extern inline public function reset(valueX:Float, valueY:Float, velocityX:Float, velocityY:Float):Void {
		flight._cpp._fn.Spring.resetSpring2d(cast this, valueX, valueY, velocityX, velocityY);
	}
	extern inline public function update(targetX:Float, targetY:Float, config:flight._cpp.SpringConfig, deltaTime:Float):Void {
		flight._cpp._fn.Spring.updateSpring2d(cast this, targetX, targetY, config, deltaTime);
	}
}

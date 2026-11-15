package flight._js;

abstract Spring2D(Dynamic) {
	static inline public function create(valueX:Float, valueY:Float, velocityX:Float, velocityY:Float):flight._js.Spring2D {
		return flight._js._fn.Spring.createSpring2d(valueX, valueY, velocityX, velocityY);
	}
	inline public function isSettled(targetX:Float, targetY:Float, positionEpsilon:Float, velocityEpsilon:Float):Bool {
		return flight._js._fn.Spring.isSpring2dSettled(cast this, targetX, targetY, positionEpsilon, velocityEpsilon);
	}
	inline public function reset(valueX:Float, valueY:Float, velocityX:Float, velocityY:Float):Void {
		flight._js._fn.Spring.resetSpring2d(cast this, valueX, valueY, velocityX, velocityY);
	}
	inline public function update(targetX:Float, targetY:Float, config:flight._js.SpringConfig, deltaTime:Float):Void {
		flight._js._fn.Spring.updateSpring2d(cast this, targetX, targetY, config, deltaTime);
	}
}

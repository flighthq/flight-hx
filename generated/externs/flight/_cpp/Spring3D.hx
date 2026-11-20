package flight._cpp;

abstract Spring3D(cpp.Star<cpp.Void>) {
	static extern inline public function create(valueX:Float, valueY:Float, valueZ:Float, velocityX:Float, velocityY:Float, velocityZ:Float):flight._cpp.Spring3D {
		return flight._cpp._fn.Spring.createSpring3d(valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
	}
	extern inline public function isSettled(targetX:Float, targetY:Float, targetZ:Float, positionEpsilon:Float, velocityEpsilon:Float):Bool {
		return flight._cpp._fn.Spring.isSpring3dSettled(cast this, targetX, targetY, targetZ, positionEpsilon, velocityEpsilon);
	}
	extern inline public function reset(valueX:Float, valueY:Float, valueZ:Float, velocityX:Float, velocityY:Float, velocityZ:Float):Void {
		flight._cpp._fn.Spring.resetSpring3d(cast this, valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
	}
	extern inline public function update(targetX:Float, targetY:Float, targetZ:Float, config:flight._cpp.SpringConfig, deltaTime:Float):Void {
		flight._cpp._fn.Spring.updateSpring3d(cast this, targetX, targetY, targetZ, config, deltaTime);
	}
}

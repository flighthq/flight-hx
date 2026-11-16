package flight._js;

abstract Spring3D(Dynamic) {
	static inline public function create(valueX:Float, valueY:Float, valueZ:Float, velocityX:Float, velocityY:Float, velocityZ:Float):flight._js.Spring3D {
		return flight._js._fn.Spring.createSpring3d(valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
	}
	inline public function isSettled(targetX:Float, targetY:Float, targetZ:Float, positionEpsilon:Null<Float>, velocityEpsilon:Null<Float>):Bool {
		return flight._js._fn.Spring.isSpring3dSettled(cast this, targetX, targetY, targetZ, positionEpsilon, velocityEpsilon);
	}
	inline public function reset(valueX:Float, valueY:Float, valueZ:Float, velocityX:Null<Float>, velocityY:Null<Float>, velocityZ:Null<Float>):Void {
		flight._js._fn.Spring.resetSpring3d(cast this, valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
	}
	inline public function update(targetX:Float, targetY:Float, targetZ:Float, config:flight._js.SpringConfig, deltaTime:Float):Void {
		flight._js._fn.Spring.updateSpring3d(cast this, targetX, targetY, targetZ, config, deltaTime);
	}
}

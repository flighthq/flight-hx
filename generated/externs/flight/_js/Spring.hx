package flight._js;

abstract Spring(Dynamic) {
	public var value(get, set):Float;
	inline function get_value():Float return untyped this["value"];
	inline function set_value(value:Float):Float return untyped this["value"] = value;
	public var velocity(get, set):Float;
	inline function get_velocity():Float return untyped this["velocity"];
	inline function set_velocity(value:Float):Float return untyped this["velocity"] = value;
	static inline public function create(value:Float, velocity:Float):flight._js.Spring {
		return flight._js._fn.Spring.createSpring(value, velocity);
	}
	inline public function addImpulse(velocity:Float):Void {
		flight._js._fn.Spring.addSpringImpulse(cast this, velocity);
	}
	inline public function isSettled(target:Float, positionEpsilon:Null<Float>, velocityEpsilon:Null<Float>):Bool {
		return flight._js._fn.Spring.isSpringSettled(cast this, target, positionEpsilon, velocityEpsilon);
	}
	inline public function reset(value:Float, velocity:Null<Float>):Void {
		flight._js._fn.Spring.resetSpring(cast this, value, velocity);
	}
	inline public function update(target:Float, config:flight._js.SpringConfig, deltaTime:Float):Void {
		flight._js._fn.Spring.updateSpring(cast this, target, config, deltaTime);
	}
	inline public function updateAngle(target:Float, fullTurn:Float, config:flight._js.SpringConfig, deltaTime:Float):Void {
		flight._js._fn.Spring.updateSpringAngle(cast this, target, fullTurn, config, deltaTime);
	}
	inline public function free():Void {
		flight._js._fn.Spring.freeSpring(cast this);
	}
}

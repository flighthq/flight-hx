package flight._js;

@:jsRequire("flight")
private extern class Spring_Ffi {
	@:native("flight_get_spring_value") static function get_value(ptr:Dynamic):Float;
	@:native("flight_set_spring_value") static function set_value(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spring_velocity") static function get_velocity(ptr:Dynamic):Float;
	@:native("flight_set_spring_velocity") static function set_velocity(ptr:Dynamic, value:Float):Float;
}

abstract Spring(Dynamic) {
	public var value(get, set):Float;

	inline function get_value():Float return Spring_Ffi.get_value(this);

	inline function set_value(value:Float):Float return Spring_Ffi.set_value(this, value);
	public var velocity(get, set):Float;

	inline function get_velocity():Float return Spring_Ffi.get_velocity(this);

	inline function set_velocity(value:Float):Float return Spring_Ffi.set_velocity(this, value);

	static inline public function create(value:Float, velocity:Float):flight._js.Spring {
		return flight._js._fn.Spring.createSpring(value, velocity);
	}
	inline public function addImpulse(velocity:Float):Void {
		flight._js._fn.Spring.addSpringImpulse(cast this, velocity);
	}
	inline public function isSettled(target:Float, positionEpsilon:Float, velocityEpsilon:Float):Bool {
		return flight._js._fn.Spring.isSpringSettled(cast this, target, positionEpsilon, velocityEpsilon);
	}
	inline public function reset(value:Float, velocity:Float):Void {
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

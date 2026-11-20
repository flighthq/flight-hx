package flight._cpp;

private extern class Spring_Ffi {
	@:native("flight_get_spring_value") static function get_value(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spring_value") static function set_value(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_spring_velocity") static function get_velocity(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_spring_velocity") static function set_velocity(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Spring(cpp.Star<cpp.Void>) {
	public var value(get, set):Float;

	inline function get_value():Float return Spring_Ffi.get_value(this);

	inline function set_value(value:Float):Float { Spring_Ffi.set_value(this, value); return value; }
	public var velocity(get, set):Float;

	inline function get_velocity():Float return Spring_Ffi.get_velocity(this);

	inline function set_velocity(value:Float):Float { Spring_Ffi.set_velocity(this, value); return value; }

	static extern inline public function create(value:Float, velocity:Float):flight._cpp.Spring {
		return flight._cpp._fn.Spring.createSpring(value, velocity);
	}
	extern inline public function addImpulse(velocity:Float):Void {
		flight._cpp._fn.Spring.addSpringImpulse(cast this, velocity);
	}
	extern inline public function isSettled(target:Float, positionEpsilon:Float, velocityEpsilon:Float):Bool {
		return flight._cpp._fn.Spring.isSpringSettled(cast this, target, positionEpsilon, velocityEpsilon);
	}
	extern inline public function reset(value:Float, velocity:Float):Void {
		flight._cpp._fn.Spring.resetSpring(cast this, value, velocity);
	}
	extern inline public function update(target:Float, config:flight._cpp.SpringConfig, deltaTime:Float):Void {
		flight._cpp._fn.Spring.updateSpring(cast this, target, config, deltaTime);
	}
	extern inline public function updateAngle(target:Float, fullTurn:Float, config:flight._cpp.SpringConfig, deltaTime:Float):Void {
		flight._cpp._fn.Spring.updateSpringAngle(cast this, target, fullTurn, config, deltaTime);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Spring.freeSpring(cast this);
	}
}

package flight._cpp;

private extern class Spring_Ffi {
	@:native("flight_get_spring_value") static function get_value(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spring_value") static function set_value(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spring_velocity") static function get_velocity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spring_velocity") static function set_velocity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Spring(cpp.Star<cpp.Void>) {
	public var value(get, set):Single;

	inline function get_value():Single return Spring_Ffi.get_value(this);

	inline function set_value(value:Single):Single { Spring_Ffi.set_value(this, value); return value; }
	public var velocity(get, set):Single;

	inline function get_velocity():Single return Spring_Ffi.get_velocity(this);

	inline function set_velocity(value:Single):Single { Spring_Ffi.set_velocity(this, value); return value; }

	static extern inline public function create(value:Single, velocity:Single):flight._cpp.Spring {
		return flight._cpp._fn.Spring.createSpring(value, velocity);
	}
	extern inline public function addImpulse(velocity:Single):Void {
		flight._cpp._fn.Spring.addSpringImpulse(cast this, velocity);
	}
	extern inline public function isSettled(target:Single, positionEpsilon:Single, velocityEpsilon:Single):Bool {
		return flight._cpp._fn.Spring.isSpringSettled(cast this, target, positionEpsilon, velocityEpsilon);
	}
	extern inline public function reset(value:Single, velocity:Single):Void {
		flight._cpp._fn.Spring.resetSpring(cast this, value, velocity);
	}
	extern inline public function update(target:Single, config:flight._cpp.SpringConfig, deltaTime:Single):Void {
		flight._cpp._fn.Spring.updateSpring(cast this, target, config, deltaTime);
	}
	extern inline public function updateAngle(target:Single, fullTurn:Single, config:flight._cpp.SpringConfig, deltaTime:Single):Void {
		flight._cpp._fn.Spring.updateSpringAngle(cast this, target, fullTurn, config, deltaTime);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Spring.freeSpring(cast this);
	}
}

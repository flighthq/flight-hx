package flight._cpp._fn;

extern class Spring {
	@:native("flight_create_spring")
	public static function createSpring(value:Single, velocity:Single):flight._cpp.Spring;
	@:native("flight_add_spring_impulse")
	public static function addSpringImpulse(spring:flight._cpp.Spring, velocity:Single):Void;
	@:native("flight_is_spring_settled")
	public static function isSpringSettled(spring:flight._cpp.Spring, target:Single, positionEpsilon:Single, velocityEpsilon:Single):Bool;
	@:native("flight_reset_spring")
	public static function resetSpring(spring:flight._cpp.Spring, value:Single, velocity:Single):Void;
	@:native("flight_update_spring")
	public static function updateSpring(spring:flight._cpp.Spring, target:Single, config:flight._cpp.SpringConfig, deltaTime:Single):Void;
	@:native("flight_update_spring_angle")
	public static function updateSpringAngle(spring:flight._cpp.Spring, target:Single, fullTurn:Single, config:flight._cpp.SpringConfig, deltaTime:Single):Void;
	@:native("flight_create_spring2d")
	public static function createSpring2d(valueX:Single, valueY:Single, velocityX:Single, velocityY:Single):flight._cpp.Spring2D;
	@:native("flight_add_spring_impulse_2d")
	public static function addSpringImpulse2d(spring2d:flight._cpp.Spring2D, velocityX:Single, velocityY:Single):Void;
	@:native("flight_is_spring2d_settled")
	public static function isSpring2dSettled(spring2d:flight._cpp.Spring2D, targetX:Single, targetY:Single, positionEpsilon:Single, velocityEpsilon:Single):Bool;
	@:native("flight_reset_spring2d")
	public static function resetSpring2d(spring2d:flight._cpp.Spring2D, valueX:Single, valueY:Single, velocityX:Single, velocityY:Single):Void;
	@:native("flight_update_spring2d")
	public static function updateSpring2d(spring2d:flight._cpp.Spring2D, targetX:Single, targetY:Single, config:flight._cpp.SpringConfig, deltaTime:Single):Void;
	@:native("flight_create_spring3d")
	public static function createSpring3d(valueX:Single, valueY:Single, valueZ:Single, velocityX:Single, velocityY:Single, velocityZ:Single):flight._cpp.Spring3D;
	@:native("flight_add_spring_impulse_3d")
	public static function addSpringImpulse3d(spring3d:flight._cpp.Spring3D, velocityX:Single, velocityY:Single, velocityZ:Single):Void;
	@:native("flight_is_spring3d_settled")
	public static function isSpring3dSettled(spring3d:flight._cpp.Spring3D, targetX:Single, targetY:Single, targetZ:Single, positionEpsilon:Single, velocityEpsilon:Single):Bool;
	@:native("flight_reset_spring3d")
	public static function resetSpring3d(spring3d:flight._cpp.Spring3D, valueX:Single, valueY:Single, valueZ:Single, velocityX:Single, velocityY:Single, velocityZ:Single):Void;
	@:native("flight_update_spring3d")
	public static function updateSpring3d(spring3d:flight._cpp.Spring3D, targetX:Single, targetY:Single, targetZ:Single, config:flight._cpp.SpringConfig, deltaTime:Single):Void;
	@:native("flight_create_spring_config")
	public static function createSpringConfig(frequency:Single, dampingRatio:Single):flight._cpp.SpringConfig;
	@:native("flight_create_spring_config_from_physical")
	public static function createSpringConfigFromPhysical(stiffness:Single, damping:Single, mass:Single):flight._cpp.SpringConfig;
	@:native("flight_free_spring")
	public static function freeSpring(ptr:flight._cpp.Spring):Void;
	@:native("flight_free_spring2_d")
	public static function freeSpring2D(ptr:flight._cpp.Spring2D):Void;
	@:native("flight_free_spring3_d")
	public static function freeSpring3D(ptr:flight._cpp.Spring3D):Void;
	@:native("flight_free_spring_config")
	public static function freeSpringConfig(ptr:flight._cpp.SpringConfig):Void;
}

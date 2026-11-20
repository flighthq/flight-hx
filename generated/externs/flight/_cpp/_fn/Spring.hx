package flight._cpp._fn;

extern class Spring {
	@:native("flight_create_spring")
	public static function createSpring(value:Float, velocity:Float):flight._cpp.Spring;
	@:native("flight_add_spring_impulse")
	public static function addSpringImpulse(spring:flight._cpp.Spring, velocity:Float):Void;
	@:native("flight_is_spring_settled")
	public static function isSpringSettled(spring:flight._cpp.Spring, target:Float, positionEpsilon:Float, velocityEpsilon:Float):Bool;
	@:native("flight_reset_spring")
	public static function resetSpring(spring:flight._cpp.Spring, value:Float, velocity:Float):Void;
	@:native("flight_update_spring")
	public static function updateSpring(spring:flight._cpp.Spring, target:Float, config:flight._cpp.SpringConfig, deltaTime:Float):Void;
	@:native("flight_update_spring_angle")
	public static function updateSpringAngle(spring:flight._cpp.Spring, target:Float, fullTurn:Float, config:flight._cpp.SpringConfig, deltaTime:Float):Void;
	@:native("flight_create_spring2d")
	public static function createSpring2d(valueX:Float, valueY:Float, velocityX:Float, velocityY:Float):flight._cpp.Spring2D;
	@:native("flight_add_spring_impulse_2d")
	public static function addSpringImpulse2d(spring2d:flight._cpp.Spring2D, velocityX:Float, velocityY:Float):Void;
	@:native("flight_is_spring2d_settled")
	public static function isSpring2dSettled(spring2d:flight._cpp.Spring2D, targetX:Float, targetY:Float, positionEpsilon:Float, velocityEpsilon:Float):Bool;
	@:native("flight_reset_spring2d")
	public static function resetSpring2d(spring2d:flight._cpp.Spring2D, valueX:Float, valueY:Float, velocityX:Float, velocityY:Float):Void;
	@:native("flight_update_spring2d")
	public static function updateSpring2d(spring2d:flight._cpp.Spring2D, targetX:Float, targetY:Float, config:flight._cpp.SpringConfig, deltaTime:Float):Void;
	@:native("flight_create_spring3d")
	public static function createSpring3d(valueX:Float, valueY:Float, valueZ:Float, velocityX:Float, velocityY:Float, velocityZ:Float):flight._cpp.Spring3D;
	@:native("flight_add_spring_impulse_3d")
	public static function addSpringImpulse3d(spring3d:flight._cpp.Spring3D, velocityX:Float, velocityY:Float, velocityZ:Float):Void;
	@:native("flight_is_spring3d_settled")
	public static function isSpring3dSettled(spring3d:flight._cpp.Spring3D, targetX:Float, targetY:Float, targetZ:Float, positionEpsilon:Float, velocityEpsilon:Float):Bool;
	@:native("flight_reset_spring3d")
	public static function resetSpring3d(spring3d:flight._cpp.Spring3D, valueX:Float, valueY:Float, valueZ:Float, velocityX:Float, velocityY:Float, velocityZ:Float):Void;
	@:native("flight_update_spring3d")
	public static function updateSpring3d(spring3d:flight._cpp.Spring3D, targetX:Float, targetY:Float, targetZ:Float, config:flight._cpp.SpringConfig, deltaTime:Float):Void;
	@:native("flight_create_spring_config")
	public static function createSpringConfig(frequency:Float, dampingRatio:Float):flight._cpp.SpringConfig;
	@:native("flight_create_spring_config_from_physical")
	public static function createSpringConfigFromPhysical(stiffness:Float, damping:Float, mass:Float):flight._cpp.SpringConfig;
	@:native("flight_free_spring")
	public static function freeSpring(ptr:flight._cpp.Spring):Void;
	@:native("flight_free_spring2_d")
	public static function freeSpring2D(ptr:flight._cpp.Spring2D):Void;
	@:native("flight_free_spring3_d")
	public static function freeSpring3D(ptr:flight._cpp.Spring3D):Void;
	@:native("flight_free_spring_config")
	public static function freeSpringConfig(ptr:flight._cpp.SpringConfig):Void;
}

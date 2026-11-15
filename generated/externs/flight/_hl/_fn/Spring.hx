package flight._hl._fn;

extern class Spring {
	@:hlNative("flight", "flight_create_spring")
	public static function createSpring(value:Single, velocity:Single):flight._hl.Spring;
	@:hlNative("flight", "flight_add_spring_impulse")
	public static function addSpringImpulse(spring:flight._hl.Spring, velocity:Single):Void;
	@:hlNative("flight", "flight_is_spring_settled")
	public static function isSpringSettled(spring:flight._hl.Spring, target:Single, positionEpsilon:Single, velocityEpsilon:Single):Bool;
	@:hlNative("flight", "flight_reset_spring")
	public static function resetSpring(spring:flight._hl.Spring, value:Single, velocity:Single):Void;
	@:hlNative("flight", "flight_update_spring")
	public static function updateSpring(spring:flight._hl.Spring, target:Single, config:flight._hl.SpringConfig, deltaTime:Single):Void;
	@:hlNative("flight", "flight_update_spring_angle")
	public static function updateSpringAngle(spring:flight._hl.Spring, target:Single, fullTurn:Single, config:flight._hl.SpringConfig, deltaTime:Single):Void;
	@:hlNative("flight", "flight_create_spring2d")
	public static function createSpring2d(valueX:Single, valueY:Single, velocityX:Single, velocityY:Single):flight._hl.Spring2D;
	@:hlNative("flight", "flight_add_spring_impulse_2d")
	public static function addSpringImpulse2d(spring2d:flight._hl.Spring2D, velocityX:Single, velocityY:Single):Void;
	@:hlNative("flight", "flight_is_spring2d_settled")
	public static function isSpring2dSettled(spring2d:flight._hl.Spring2D, targetX:Single, targetY:Single, positionEpsilon:Single, velocityEpsilon:Single):Bool;
	@:hlNative("flight", "flight_reset_spring2d")
	public static function resetSpring2d(spring2d:flight._hl.Spring2D, valueX:Single, valueY:Single, velocityX:Single, velocityY:Single):Void;
	@:hlNative("flight", "flight_update_spring2d")
	public static function updateSpring2d(spring2d:flight._hl.Spring2D, targetX:Single, targetY:Single, config:flight._hl.SpringConfig, deltaTime:Single):Void;
	@:hlNative("flight", "flight_create_spring3d")
	public static function createSpring3d(valueX:Single, valueY:Single, valueZ:Single, velocityX:Single, velocityY:Single, velocityZ:Single):flight._hl.Spring3D;
	@:hlNative("flight", "flight_add_spring_impulse_3d")
	public static function addSpringImpulse3d(spring3d:flight._hl.Spring3D, velocityX:Single, velocityY:Single, velocityZ:Single):Void;
	@:hlNative("flight", "flight_is_spring3d_settled")
	public static function isSpring3dSettled(spring3d:flight._hl.Spring3D, targetX:Single, targetY:Single, targetZ:Single, positionEpsilon:Single, velocityEpsilon:Single):Bool;
	@:hlNative("flight", "flight_reset_spring3d")
	public static function resetSpring3d(spring3d:flight._hl.Spring3D, valueX:Single, valueY:Single, valueZ:Single, velocityX:Single, velocityY:Single, velocityZ:Single):Void;
	@:hlNative("flight", "flight_update_spring3d")
	public static function updateSpring3d(spring3d:flight._hl.Spring3D, targetX:Single, targetY:Single, targetZ:Single, config:flight._hl.SpringConfig, deltaTime:Single):Void;
	@:hlNative("flight", "flight_create_spring_config")
	public static function createSpringConfig(frequency:Single, dampingRatio:Single):flight._hl.SpringConfig;
	@:hlNative("flight", "flight_create_spring_config_from_physical")
	public static function createSpringConfigFromPhysical(stiffness:Single, damping:Single, mass:Single):flight._hl.SpringConfig;
	@:hlNative("flight", "flight_free_spring")
	public static function freeSpring(ptr:flight._hl.Spring):Void;
	@:hlNative("flight", "flight_free_spring2_d")
	public static function freeSpring2D(ptr:flight._hl.Spring2D):Void;
	@:hlNative("flight", "flight_free_spring3_d")
	public static function freeSpring3D(ptr:flight._hl.Spring3D):Void;
	@:hlNative("flight", "flight_free_spring_config")
	public static function freeSpringConfig(ptr:flight._hl.SpringConfig):Void;
}

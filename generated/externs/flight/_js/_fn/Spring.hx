package flight._js._fn;

@:jsRequire("@flighthq/spring")
extern class Spring {
	@:native("createSpring")
	public static function createSpring(value:Float, velocity:Float):flight._js.Spring;
	@:native("addSpringImpulse")
	public static function addSpringImpulse(spring:flight._js.Spring, velocity:Float):Void;
	@:native("isSpringSettled")
	public static function isSpringSettled(spring:flight._js.Spring, target:Float, positionEpsilon:Null<Float>, velocityEpsilon:Null<Float>):Bool;
	@:native("resetSpring")
	public static function resetSpring(spring:flight._js.Spring, value:Float, velocity:Null<Float>):Void;
	@:native("updateSpring")
	public static function updateSpring(spring:flight._js.Spring, target:Float, config:flight._js.SpringConfig, deltaTime:Float):Void;
	@:native("updateSpringAngle")
	public static function updateSpringAngle(spring:flight._js.Spring, target:Float, fullTurn:Float, config:flight._js.SpringConfig, deltaTime:Float):Void;
	@:native("createSpring2D")
	public static function createSpring2d(valueX:Float, valueY:Float, velocityX:Float, velocityY:Float):flight._js.Spring2D;
	@:native("addSpringImpulse2D")
	public static function addSpringImpulse2d(spring2d:flight._js.Spring2D, velocityX:Float, velocityY:Float):Void;
	@:native("isSpring2DSettled")
	public static function isSpring2dSettled(spring2d:flight._js.Spring2D, targetX:Float, targetY:Float, positionEpsilon:Null<Float>, velocityEpsilon:Null<Float>):Bool;
	@:native("resetSpring2D")
	public static function resetSpring2d(spring2d:flight._js.Spring2D, valueX:Float, valueY:Float, velocityX:Null<Float>, velocityY:Null<Float>):Void;
	@:native("updateSpring2D")
	public static function updateSpring2d(spring2d:flight._js.Spring2D, targetX:Float, targetY:Float, config:flight._js.SpringConfig, deltaTime:Float):Void;
	@:native("createSpring3D")
	public static function createSpring3d(valueX:Float, valueY:Float, valueZ:Float, velocityX:Float, velocityY:Float, velocityZ:Float):flight._js.Spring3D;
	@:native("addSpringImpulse3D")
	public static function addSpringImpulse3d(spring3d:flight._js.Spring3D, velocityX:Float, velocityY:Float, velocityZ:Float):Void;
	@:native("isSpring3DSettled")
	public static function isSpring3dSettled(spring3d:flight._js.Spring3D, targetX:Float, targetY:Float, targetZ:Float, positionEpsilon:Null<Float>, velocityEpsilon:Null<Float>):Bool;
	@:native("resetSpring3D")
	public static function resetSpring3d(spring3d:flight._js.Spring3D, valueX:Float, valueY:Float, valueZ:Float, velocityX:Null<Float>, velocityY:Null<Float>, velocityZ:Null<Float>):Void;
	@:native("updateSpring3D")
	public static function updateSpring3d(spring3d:flight._js.Spring3D, targetX:Float, targetY:Float, targetZ:Float, config:flight._js.SpringConfig, deltaTime:Float):Void;
	@:native("createSpringConfig")
	public static function createSpringConfig(frequency:Float, dampingRatio:Float):flight._js.SpringConfig;
	@:native("createSpringConfigFromPhysical")
	public static function createSpringConfigFromPhysical(stiffness:Float, damping:Float, mass:Float):flight._js.SpringConfig;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpring(ptr:flight._js.Spring):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpring2D(ptr:flight._js.Spring2D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpring3D(ptr:flight._js.Spring3D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpringConfig(ptr:flight._js.SpringConfig):Void {}
}

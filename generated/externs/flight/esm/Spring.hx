package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/spring")
extern class Spring {
  public static final SpringPresetBouncy:flight.esm.types.spring.Types.SpringConfig;
  public static final SpringPresetGentle:flight.esm.types.spring.Types.SpringConfig;
  public static final SpringPresetStiff:flight.esm.types.spring.Types.SpringConfig;
  public static function addSpringImpulse(spring:flight.esm.types.spring.Types.Spring, velocity:Float):Void;
  public static function addSpringImpulse2D(spring2D:flight.esm.types.spring.Types.Spring2D, velocityX:Float, velocityY:Float):Void;
  public static function addSpringImpulse3D(spring3D:flight.esm.types.spring.Types.Spring3D, velocityX:Float, velocityY:Float, velocityZ:Float):Void;
  public static function createSpring(?value:Float, ?velocity:Float):flight.esm.types.spring.Types.Spring;
  public static function createSpring2D(?valueX:Float, ?valueY:Float, ?velocityX:Float, ?velocityY:Float):flight.esm.types.spring.Types.Spring2D;
  public static function createSpring3D(?valueX:Float, ?valueY:Float, ?valueZ:Float, ?velocityX:Float, ?velocityY:Float, ?velocityZ:Float):flight.esm.types.spring.Types.Spring3D;
  public static function createSpringConfig(frequency:Float, dampingRatio:Float):flight.esm.types.spring.Types.SpringConfig;
  public static function createSpringConfigFromPhysical(stiffness:Float, damping:Float, mass:Float):flight.esm.types.spring.Types.SpringConfig;
  public static function isSpring2DSettled(spring2D:flight.esm.types.spring.Types.Spring2D, targetX:Float, targetY:Float, ?positionEpsilon:Null<Float>, ?velocityEpsilon:Null<Float>):Bool;
  public static function isSpring3DSettled(spring3D:flight.esm.types.spring.Types.Spring3D, targetX:Float, targetY:Float, targetZ:Float, ?positionEpsilon:Null<Float>, ?velocityEpsilon:Null<Float>):Bool;
  public static function isSpringSettled(spring:flight.esm.types.spring.Types.Spring, target:Float, ?positionEpsilon:Float, ?velocityEpsilon:Float):Bool;
  public static function resetSpring(spring:flight.esm.types.spring.Types.Spring, value:Float, ?velocity:Float):Void;
  public static function resetSpring2D(spring2D:flight.esm.types.spring.Types.Spring2D, valueX:Float, valueY:Float, ?velocityX:Float, ?velocityY:Float):Void;
  public static function resetSpring3D(spring3D:flight.esm.types.spring.Types.Spring3D, valueX:Float, valueY:Float, valueZ:Float, ?velocityX:Float, ?velocityY:Float, ?velocityZ:Float):Void;
  public static function updateSpring(spring:flight.esm.types.spring.Types.Spring, target:Float, config:flight.esm.types.spring.Types.SpringConfig, deltaTime:Float):Void;
  public static function updateSpring2D(spring2D:flight.esm.types.spring.Types.Spring2D, targetX:Float, targetY:Float, config:flight.esm.types.spring.Types.SpringConfig, deltaTime:Float):Void;
  public static function updateSpring3D(spring3D:flight.esm.types.spring.Types.Spring3D, targetX:Float, targetY:Float, targetZ:Float, config:flight.esm.types.spring.Types.SpringConfig, deltaTime:Float):Void;
  public static function updateSpringAngle(spring:flight.esm.types.spring.Types.Spring, target:Float, fullTurn:Float, config:flight.esm.types.spring.Types.SpringConfig, deltaTime:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

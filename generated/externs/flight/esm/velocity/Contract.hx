package flight.esm.velocity;

#if (js && flight_esm)
@:jsRequire("@flighthq/velocity/contract")
extern class Contract {
  public static function addVelocity(out:flight.esm.types.velocity.Types.Velocity2D, a:flight.esm.types.velocity.Types.Velocity2D, b:flight.esm.types.velocity.Types.Velocity2D):Void;
  public static function beginVelocityFrame(field:flight.esm.types.velocity.Types.VelocityField):Void;
  public static function clampVelocity(out:flight.esm.types.velocity.Types.Velocity2D, velocity:flight.esm.types.velocity.Types.Velocity2D, maxLength:Float):Void;
  public static function cloneVelocity2D(source:flight.esm.types.velocity.Types.Velocity2D):flight.esm.types.velocity.Types.Velocity2D;
  public static function contributeTransformVelocity(field:flight.esm.types.velocity.Types.VelocityField, root:flight.esm.types.node.Types.NodeAny):Void;
  public static function contributeVelocity(field:flight.esm.types.velocity.Types.VelocityField, source:Dynamic, x:Float, y:Float):Void;
  public static function copyVelocity(out:flight.esm.types.velocity.Types.Velocity2D, source:flight.esm.types.velocity.Types.Velocity2D):Void;
  public static function createVelocityField():flight.esm.types.velocity.Types.VelocityField;
  public static function createVelocitySample():flight.esm.types.velocity.Types.VelocitySample;
  public static function dampVelocity(out:flight.esm.types.velocity.Types.Velocity2D, current:flight.esm.types.velocity.Types.Velocity2D, previous:flight.esm.types.velocity.Types.Velocity2D, factor:Float):Void;
  public static function ensureNodeVelocitySample(field:flight.esm.types.velocity.Types.VelocityField, node:Dynamic):flight.esm.types.velocity.Types.VelocitySample;
  public static function ensureVelocitySample(field:flight.esm.types.velocity.Types.VelocityField, source:Dynamic):flight.esm.types.velocity.Types.VelocitySample;
  public static function explainVelocity(field:flight.esm.types.velocity.Types.VelocityField, source:Dynamic):flight.esm.types.velocity.Types.VelocityExplanation;
  public static function explainVelocitySample(sample:Null<flight.esm.types.velocity.Types.VelocitySample>, frameId:Float):flight.esm.types.velocity.Types.VelocityExplanation;
  public static function findVelocitySample(field:flight.esm.types.velocity.Types.VelocityField, source:Dynamic):Null<flight.esm.types.velocity.Types.VelocitySample>;
  public static function getVelocity(field:flight.esm.types.velocity.Types.VelocityField, source:Dynamic, out:flight.esm.types.velocity.Types.Velocity2D):Void;
  public static function getVelocityReasonString(value:flight.esm.types.velocity.Types.VelocityReason):String;
  public static function getVelocitySampleAt(sample:flight.esm.types.velocity.Types.VelocitySample, currentWorldTransform:flight.esm.types.geometry.Types.Matrix, pointX:Float, pointY:Float, out:flight.esm.types.velocity.Types.Velocity2D):Void;
  public static function hasVelocity(field:flight.esm.types.velocity.Types.VelocityField, source:Dynamic):Bool;
  public static function initializeVelocityField(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.velocity.Types.VelocityField>):Void;
  public static function isVelocitySampleNonzero(sample:Null<flight.esm.types.velocity.Types.VelocitySample>, frameId:Float):Bool;
  public static function isVelocityZero(velocity:flight.esm.types.velocity.Types.Velocity2D, ?epsilon:Null<Float>):Bool;
  public static function lengthOfVelocity(velocity:flight.esm.types.velocity.Types.Velocity2D):Float;
  public static function lerpVelocity(out:flight.esm.types.velocity.Types.Velocity2D, a:flight.esm.types.velocity.Types.Velocity2D, b:flight.esm.types.velocity.Types.Velocity2D, t:Float):Void;
  public static function normalizeVelocity(out:flight.esm.types.velocity.Types.Velocity2D, source:flight.esm.types.velocity.Types.Velocity2D):Void;
  public static function parseVelocityReason(value:String):Null<String>;
  public static function readVelocitySample(sample:Null<flight.esm.types.velocity.Types.VelocitySample>, frameId:Float, out:flight.esm.types.velocity.Types.Velocity2D):Void;
  public static function scaleVelocity(out:flight.esm.types.velocity.Types.Velocity2D, velocity:flight.esm.types.velocity.Types.Velocity2D, scale:Float):Void;
  public static function subtractVelocity(out:flight.esm.types.velocity.Types.Velocity2D, a:flight.esm.types.velocity.Types.Velocity2D, b:flight.esm.types.velocity.Types.Velocity2D):Void;
  public static function suppressVelocity(field:flight.esm.types.velocity.Types.VelocityField, source:Dynamic):Void;
  public static function writeVelocitySample(sample:flight.esm.types.velocity.Types.VelocitySample, frameId:Float, x:Float, y:Float):Void;
  public static function zeroVelocity(out:flight.esm.types.velocity.Types.Velocity2D):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

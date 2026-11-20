package flight.esm.motionpath;

#if (js && flight_esm)
@:jsRequire("@flighthq/motionpath/contract")
extern class Contract {
  public static function createMotionPath(path:flight.esm.types.path_contract.Types.PathRaw, ?speed:Null<Float>, ?loopMode:Null<String>, ?tolerance:Null<Float>):flight.esm.types.motionpath.Types.MotionPathRaw;
  public static function getMotionPathHeading(mp:flight.esm.types.motionpath.Types.MotionPathRaw):Float;
  public static function getMotionPathLoopModeString(value:flight.esm.types.motionpath.Types.MotionPathLoopMode):String;
  public static function getMotionPathPosition(mp:flight.esm.types.motionpath.Types.MotionPathRaw, pointOut:flight.esm.types.geometry.Types.Vector2Like, tangentOut:flight.esm.types.geometry.Types.Vector2Like):Bool;
  public static function getMotionPathProgress(mp:flight.esm.types.motionpath.Types.MotionPathRaw):Float;
  public static function initializeMotionPath(out:flight.esm.types.motionpath.Types.MotionPathRaw, path:flight.esm.types.path_contract.Types.PathRaw, ?speed:Null<Float>, ?loopMode:Null<String>, ?tolerance:Null<Float>):Void;
  public static function isMotionPathAtEnd(mp:flight.esm.types.motionpath.Types.MotionPathRaw):Bool;
  public static function parseMotionPathLoopMode(value:String):Null<String>;
  public static function setMotionPathDirection(mp:flight.esm.types.motionpath.Types.MotionPathRaw, direction:flight.esm.types.motionpath.Types.MotionPathDirection):Void;
  public static function setMotionPathDistance(mp:flight.esm.types.motionpath.Types.MotionPathRaw, distance:Float):Void;
  public static function setMotionPathProgress(mp:flight.esm.types.motionpath.Types.MotionPathRaw, t:Float):Void;
  public static function updateMotionPath(mp:flight.esm.types.motionpath.Types.MotionPathRaw, deltaTime:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

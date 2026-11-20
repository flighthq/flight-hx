package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/clip")
extern class Clip {
  public static final ClipRegionContoursReason:Dynamic;
  public static final ClipRegionStatus:Dynamic;
  public static function acquireClipRegion():flight.esm.types.clip.Types.ClipRegion;
  public static function clipRegionContainsClipRegion(a:flight.esm.types.clip.Types.ClipRegion, b:flight.esm.types.clip.Types.ClipRegion):Bool;
  public static function clipRegionContainsPoint(clip:flight.esm.types.clip.Types.ClipRegion, x:Float, y:Float):Bool;
  public static function clipRegionContainsRectangle(clip:flight.esm.types.clip.Types.ClipRegion, rectangle:flight.esm.types.geometry.Types.RectangleLike):Bool;
  public static function clipRegionIntersectsClipRegion(a:flight.esm.types.clip.Types.ClipRegion, b:flight.esm.types.clip.Types.ClipRegion):Bool;
  public static function clipRegionIntersectsRectangle(clip:flight.esm.types.clip.Types.ClipRegion, rectangle:flight.esm.types.geometry.Types.RectangleLike):Bool;
  public static function cloneClipRegion(clip:flight.esm.types.clip.Types.ClipRegion):flight.esm.types.clip.Types.ClipRegion;
  public static function copyClipRegion(out:flight.esm.types.clip.Types.ClipRegion, source:flight.esm.types.clip.Types.ClipRegion):Void;
  public static function createClipRegionFromCircle(x:Float, y:Float, radius:Float, ?tolerance:Null<Float>):flight.esm.types.clip.Types.ClipRegion;
  public static function createClipRegionFromContours(contours:Array<Array<Float>>, winding:flight.esm.types.path.Types.PathWinding):flight.esm.types.clip.Types.ClipRegion;
  public static function createClipRegionFromEllipse(rectangle:flight.esm.types.geometry.Types.RectangleLike, ?tolerance:Null<Float>):flight.esm.types.clip.Types.ClipRegion;
  public static function createClipRegionFromPath(path:flight.esm.types.path_contract.Types.PathRaw, ?tolerance:Null<Float>):flight.esm.types.clip.Types.ClipRegion;
  public static function createClipRegionFromRectangle(rectangle:flight.esm.types.geometry.Types.RectangleLike):flight.esm.types.clip.Types.ClipRegion;
  public static function createClipRegionFromRoundedRectangle(rectangle:flight.esm.types.geometry.Types.RectangleLike, radius:Float, ?tolerance:Null<Float>):flight.esm.types.clip.Types.ClipRegion;
  public static function disableClipGuards():Void;
  public static function enableClipGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function equalsClipRegion(a:flight.esm.types.clip.Types.ClipRegion, b:flight.esm.types.clip.Types.ClipRegion):Bool;
  public static function explainClipRegion(clip:flight.esm.types.clip.Types.ClipRegion):flight.esm.types.clip.Types.ClipRegionExplanation;
  public static function explainClipRegionContours(contours:Array<Array<Float>>):Null<flight.esm.types.clip.Types.ClipRegionContoursExplanation>;
  public static function getClipRegionBounds(out:flight.esm.types.geometry.Types.RectangleLike, clip:flight.esm.types.clip.Types.ClipRegion):Void;
  public static function intersectClipRegions(out:flight.esm.types.clip.Types.ClipRegion, a:flight.esm.types.clip.Types.ClipRegion, b:flight.esm.types.clip.Types.ClipRegion):Void;
  public static function invalidateClipRegion(clip:flight.esm.types.clip.Types.ClipRegion):Void;
  public static function isClipRegionEmpty(clip:flight.esm.types.clip.Types.ClipRegion):Bool;
  public static function isClipRegionRectangular(clip:flight.esm.types.clip.Types.ClipRegion):Bool;
  public static function normalizeClipRegion(out:flight.esm.types.clip.Types.ClipRegion, clip:flight.esm.types.clip.Types.ClipRegion):Void;
  public static function releaseClipRegion(clip:flight.esm.types.clip.Types.ClipRegion):Void;
  public static function setClipRegionToContours(out:flight.esm.types.clip.Types.ClipRegion, contours:Array<Array<Float>>, winding:flight.esm.types.path.Types.PathWinding):Void;
  public static function setClipRegionToRectangle(out:flight.esm.types.clip.Types.ClipRegion, rectangle:flight.esm.types.geometry.Types.RectangleLike):Void;
  public static function transformClipRegion(out:flight.esm.types.clip.Types.ClipRegion, clip:flight.esm.types.clip.Types.ClipRegion, matrix:flight.esm.types.geometry.Types.MatrixLike):Void;
  public static function unionClipRegions(out:flight.esm.types.clip.Types.ClipRegion, a:flight.esm.types.clip.Types.ClipRegion, b:flight.esm.types.clip.Types.ClipRegion):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

package flight._js._fn;

@:jsRequire("@flighthq/motionpath")
extern class Motionpath {
	@:native("createMotionPath")
	public static function createMotionPath(path:Dynamic, speed:Null<Float>, loopMode:Null<Dynamic>, tolerance:Null<Float>):flight._js.MotionPath;
	@:native("getMotionPathHeading")
	public static function getMotionPathHeading(mp:flight._js.MotionPath):Float;
	@:native("getMotionPathPosition")
	public static function getMotionPathPosition(mp:flight._js.MotionPath, pointOut:flight._js.Vector2, tangentOut:flight._js.Vector2):Bool;
	@:native("getMotionPathProgress")
	public static function getMotionPathProgress(mp:flight._js.MotionPath):Float;
	@:native("isMotionPathAtEnd")
	public static function isMotionPathAtEnd(mp:flight._js.MotionPath):Bool;
	@:native("setMotionPathDirection")
	public static function setMotionPathDirection(mp:flight._js.MotionPath, direction:flight._js.MotionPathDirection):Void;
	@:native("setMotionPathDistance")
	public static function setMotionPathDistance(mp:flight._js.MotionPath, distance:Float):Void;
	@:native("setMotionPathProgress")
	public static function setMotionPathProgress(mp:flight._js.MotionPath, t:Float):Void;
	@:native("updateMotionPath")
	public static function updateMotionPath(mp:flight._js.MotionPath, deltaTime:Float):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMotionPath(ptr:flight._js.MotionPath):Void {}
}

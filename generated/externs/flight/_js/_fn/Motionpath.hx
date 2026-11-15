package flight._js._fn;

@:jsRequire("flight")
extern class Motionpath {
	@:native("flight_create_motion_path")
	public static function createMotionPath(path:Dynamic, speed:Float, loopMode:Int, tolerance:Float):flight._js.MotionPath;
	@:native("flight_get_motion_path_heading")
	public static function getMotionPathHeading(mp:flight._js.MotionPath):Float;
	@:native("flight_get_motion_path_position")
	public static function getMotionPathPosition(mp:flight._js.MotionPath, pointOut:flight._js.Vector2, tangentOut:flight._js.Vector2):Bool;
	@:native("flight_get_motion_path_progress")
	public static function getMotionPathProgress(mp:flight._js.MotionPath):Float;
	@:native("flight_is_motion_path_at_end")
	public static function isMotionPathAtEnd(mp:flight._js.MotionPath):Bool;
	@:native("flight_set_motion_path_direction")
	public static function setMotionPathDirection(mp:flight._js.MotionPath, direction:Int):Void;
	@:native("flight_set_motion_path_distance")
	public static function setMotionPathDistance(mp:flight._js.MotionPath, distance:Float):Void;
	@:native("flight_set_motion_path_progress")
	public static function setMotionPathProgress(mp:flight._js.MotionPath, t:Float):Void;
	@:native("flight_update_motion_path")
	public static function updateMotionPath(mp:flight._js.MotionPath, deltaTime:Float):Void;
	@:native("flight_free_motion_path")
	public static function freeMotionPath(ptr:flight._js.MotionPath):Void;
}

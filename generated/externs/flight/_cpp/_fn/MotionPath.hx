package flight._cpp._fn;

extern class MotionPath {
	@:native("flight_create_motion_path")
	public static function createMotionPath(path:cpp.Star<cpp.Void>, speed:Float, loopMode:Int, tolerance:Float):flight._cpp.MotionPath;
	@:native("flight_get_motion_path_heading")
	public static function getMotionPathHeading(mp:flight._cpp.MotionPath):Float;
	@:native("flight_get_motion_path_position")
	public static function getMotionPathPosition(mp:flight._cpp.MotionPath, pointOut:flight._cpp.Vector2, tangentOut:flight._cpp.Vector2):Bool;
	@:native("flight_get_motion_path_progress")
	public static function getMotionPathProgress(mp:flight._cpp.MotionPath):Float;
	@:native("flight_is_motion_path_at_end")
	public static function isMotionPathAtEnd(mp:flight._cpp.MotionPath):Bool;
	@:native("flight_set_motion_path_direction")
	public static function setMotionPathDirection(mp:flight._cpp.MotionPath, direction:flight._cpp.MotionPathDirection):Void;
	@:native("flight_set_motion_path_distance")
	public static function setMotionPathDistance(mp:flight._cpp.MotionPath, distance:Float):Void;
	@:native("flight_set_motion_path_progress")
	public static function setMotionPathProgress(mp:flight._cpp.MotionPath, t:Float):Void;
	@:native("flight_update_motion_path")
	public static function updateMotionPath(mp:flight._cpp.MotionPath, deltaTime:Float):Void;
	@:native("flight_free_motion_path")
	public static function freeMotionPath(ptr:flight._cpp.MotionPath):Void;
}

package flight._hl._fn;

extern class Motionpath {
	@:hlNative("flight", "flight_create_motion_path")
	public static function createMotionPath(path:hl.Bytes, speed:Float, loopMode:Int, tolerance:Float):flight._hl.MotionPath;
	@:hlNative("flight", "flight_get_motion_path_heading")
	public static function getMotionPathHeading(mp:flight._hl.MotionPath):Float;
	@:hlNative("flight", "flight_get_motion_path_position")
	public static function getMotionPathPosition(mp:flight._hl.MotionPath, pointOut:flight._hl.Vector2, tangentOut:flight._hl.Vector2):Bool;
	@:hlNative("flight", "flight_get_motion_path_progress")
	public static function getMotionPathProgress(mp:flight._hl.MotionPath):Float;
	@:hlNative("flight", "flight_is_motion_path_at_end")
	public static function isMotionPathAtEnd(mp:flight._hl.MotionPath):Bool;
	@:hlNative("flight", "flight_set_motion_path_direction")
	public static function setMotionPathDirection(mp:flight._hl.MotionPath, direction:flight._hl.MotionPathDirection):Void;
	@:hlNative("flight", "flight_set_motion_path_distance")
	public static function setMotionPathDistance(mp:flight._hl.MotionPath, distance:Float):Void;
	@:hlNative("flight", "flight_set_motion_path_progress")
	public static function setMotionPathProgress(mp:flight._hl.MotionPath, t:Float):Void;
	@:hlNative("flight", "flight_update_motion_path")
	public static function updateMotionPath(mp:flight._hl.MotionPath, deltaTime:Float):Void;
	@:hlNative("flight", "flight_free_motion_path")
	public static function freeMotionPath(ptr:flight._hl.MotionPath):Void;
}

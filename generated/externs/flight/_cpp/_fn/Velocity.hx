package flight._cpp._fn;

extern class Velocity {
	@:native("flight_contribute_transform_velocity")
	public static function contributeTransformVelocity(field:flight._cpp.VelocityField, root:flight._cpp.FlightNode):Void;
	@:native("flight_add_velocity")
	public static function addVelocity(out:flight._cpp.Velocity2D, a:flight._cpp.Velocity2D, b:flight._cpp.Velocity2D):Void;
	@:native("flight_clamp_velocity")
	public static function clampVelocity(out:flight._cpp.Velocity2D, velocity:flight._cpp.Velocity2D, maxLength:Float):Void;
	@:native("flight_copy_velocity")
	public static function copyVelocity(out:flight._cpp.Velocity2D, source:flight._cpp.Velocity2D):Void;
	@:native("flight_damp_velocity")
	public static function dampVelocity(out:flight._cpp.Velocity2D, current:flight._cpp.Velocity2D, previous:flight._cpp.Velocity2D, factor:Float):Void;
	@:native("flight_is_velocity_zero")
	public static function isVelocityZero(velocity:flight._cpp.Velocity2D, epsilon:Float):Bool;
	@:native("flight_length_of_velocity")
	public static function lengthOfVelocity(velocity:flight._cpp.Velocity2D):Float;
	@:native("flight_lerp_velocity")
	public static function lerpVelocity(out:flight._cpp.Velocity2D, a:flight._cpp.Velocity2D, b:flight._cpp.Velocity2D, t:Float):Void;
	@:native("flight_normalize_velocity")
	public static function normalizeVelocity(out:flight._cpp.Velocity2D, source:flight._cpp.Velocity2D):Void;
	@:native("flight_scale_velocity")
	public static function scaleVelocity(out:flight._cpp.Velocity2D, velocity:flight._cpp.Velocity2D, scale:Float):Void;
	@:native("flight_subtract_velocity")
	public static function subtractVelocity(out:flight._cpp.Velocity2D, a:flight._cpp.Velocity2D, b:flight._cpp.Velocity2D):Void;
	@:native("flight_zero_velocity")
	public static function zeroVelocity(out:flight._cpp.Velocity2D):Void;
	@:native("flight_get_velocity_sample_at")
	public static function getVelocitySampleAt(sample:flight._cpp.VelocitySample, currentWorldTransform:flight._cpp.Matrix, pointX:Float, pointY:Float, out:flight._cpp.Velocity2D):Void;
	@:native("flight_create_velocity_field")
	public static function createVelocityField():flight._cpp.VelocityField;
	@:native("flight_begin_velocity_frame")
	public static function beginVelocityFrame(field:flight._cpp.VelocityField):Void;
	@:native("flight_contribute_velocity")
	public static function contributeVelocity(field:flight._cpp.VelocityField, source:haxe.Int64, x:Float, y:Float):Void;
	@:native("flight_explain_velocity")
	public static function explainVelocity(field:flight._cpp.VelocityField, source:haxe.Int64):flight._cpp.VelocityExplanation;
	@:native("flight_get_velocity")
	public static function getVelocity(field:flight._cpp.VelocityField, source:haxe.Int64, out:flight._cpp.Velocity2D):Void;
	@:native("flight_has_velocity")
	public static function hasVelocity(field:flight._cpp.VelocityField, source:haxe.Int64):Bool;
	@:native("flight_suppress_velocity")
	public static function suppressVelocity(field:flight._cpp.VelocityField, source:haxe.Int64):Void;
	@:native("flight_free_velocity_field")
	public static function freeVelocityField(ptr:flight._cpp.VelocityField):Void;
	@:native("flight_free_velocity_explanation")
	public static function freeVelocityExplanation(ptr:flight._cpp.VelocityExplanation):Void;
}

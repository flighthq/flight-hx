package flight._js._fn;

@:jsRequire("flight")
extern class Velocity {
	@:native("flight_contribute_transform_velocity")
	public static function contributeTransformVelocity(field:flight._js.VelocityField, root:Dynamic):Void;
	@:native("flight_add_velocity")
	public static function addVelocity(out:flight._js.Velocity2D, a:flight._js.Velocity2D, b:flight._js.Velocity2D):Void;
	@:native("flight_clamp_velocity")
	public static function clampVelocity(out:flight._js.Velocity2D, velocity:flight._js.Velocity2D, maxLength:Float):Void;
	@:native("flight_copy_velocity")
	public static function copyVelocity(out:flight._js.Velocity2D, source:flight._js.Velocity2D):Void;
	@:native("flight_damp_velocity")
	public static function dampVelocity(out:flight._js.Velocity2D, current:flight._js.Velocity2D, previous:flight._js.Velocity2D, factor:Float):Void;
	@:native("flight_is_velocity_zero")
	public static function isVelocityZero(velocity:flight._js.Velocity2D, epsilon:Float):Bool;
	@:native("flight_length_of_velocity")
	public static function lengthOfVelocity(velocity:flight._js.Velocity2D):Float;
	@:native("flight_lerp_velocity")
	public static function lerpVelocity(out:flight._js.Velocity2D, a:flight._js.Velocity2D, b:flight._js.Velocity2D, t:Float):Void;
	@:native("flight_normalize_velocity")
	public static function normalizeVelocity(out:flight._js.Velocity2D, source:flight._js.Velocity2D):Void;
	@:native("flight_scale_velocity")
	public static function scaleVelocity(out:flight._js.Velocity2D, velocity:flight._js.Velocity2D, scale:Float):Void;
	@:native("flight_subtract_velocity")
	public static function subtractVelocity(out:flight._js.Velocity2D, a:flight._js.Velocity2D, b:flight._js.Velocity2D):Void;
	@:native("flight_zero_velocity")
	public static function zeroVelocity(out:flight._js.Velocity2D):Void;
	@:native("flight_get_velocity_sample_at")
	public static function getVelocitySampleAt(sample:flight._js.VelocitySample, currentWorldTransform:flight._js.Matrix, pointX:Float, pointY:Float, out:flight._js.Velocity2D):Void;
	@:native("flight_create_velocity_field")
	public static function createVelocityField():flight._js.VelocityField;
	@:native("flight_begin_velocity_frame")
	public static function beginVelocityFrame(field:flight._js.VelocityField):Void;
	@:native("flight_contribute_velocity")
	public static function contributeVelocity(field:flight._js.VelocityField, source:haxe.Int64, x:Float, y:Float):Void;
	@:native("flight_explain_velocity")
	public static function explainVelocity(field:flight._js.VelocityField, source:haxe.Int64):flight._js.VelocityExplanation;
	@:native("flight_get_velocity")
	public static function getVelocity(field:flight._js.VelocityField, source:haxe.Int64, out:flight._js.Velocity2D):Void;
	@:native("flight_has_velocity")
	public static function hasVelocity(field:flight._js.VelocityField, source:haxe.Int64):Bool;
	@:native("flight_suppress_velocity")
	public static function suppressVelocity(field:flight._js.VelocityField, source:haxe.Int64):Void;
	@:native("flight_free_velocity_field")
	public static function freeVelocityField(ptr:flight._js.VelocityField):Void;
	@:native("flight_free_velocity_explanation")
	public static function freeVelocityExplanation(ptr:flight._js.VelocityExplanation):Void;
}

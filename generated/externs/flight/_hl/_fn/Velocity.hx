package flight._hl._fn;

extern class Velocity {
	@:hlNative("flight", "flight_contribute_transform_velocity")
	public static function contributeTransformVelocity(field:flight._hl.VelocityField, root:hl.Bytes):Void;
	@:hlNative("flight", "flight_add_velocity")
	public static function addVelocity(out:flight._hl.Velocity2D, a:flight._hl.Velocity2D, b:flight._hl.Velocity2D):Void;
	@:hlNative("flight", "flight_clamp_velocity")
	public static function clampVelocity(out:flight._hl.Velocity2D, velocity:flight._hl.Velocity2D, maxLength:Single):Void;
	@:hlNative("flight", "flight_copy_velocity")
	public static function copyVelocity(out:flight._hl.Velocity2D, source:flight._hl.Velocity2D):Void;
	@:hlNative("flight", "flight_damp_velocity")
	public static function dampVelocity(out:flight._hl.Velocity2D, current:flight._hl.Velocity2D, previous:flight._hl.Velocity2D, factor:Single):Void;
	@:hlNative("flight", "flight_is_velocity_zero")
	public static function isVelocityZero(velocity:flight._hl.Velocity2D, epsilon:Single):Bool;
	@:hlNative("flight", "flight_length_of_velocity")
	public static function lengthOfVelocity(velocity:flight._hl.Velocity2D):Single;
	@:hlNative("flight", "flight_lerp_velocity")
	public static function lerpVelocity(out:flight._hl.Velocity2D, a:flight._hl.Velocity2D, b:flight._hl.Velocity2D, t:Single):Void;
	@:hlNative("flight", "flight_normalize_velocity")
	public static function normalizeVelocity(out:flight._hl.Velocity2D, source:flight._hl.Velocity2D):Void;
	@:hlNative("flight", "flight_scale_velocity")
	public static function scaleVelocity(out:flight._hl.Velocity2D, velocity:flight._hl.Velocity2D, scale:Single):Void;
	@:hlNative("flight", "flight_subtract_velocity")
	public static function subtractVelocity(out:flight._hl.Velocity2D, a:flight._hl.Velocity2D, b:flight._hl.Velocity2D):Void;
	@:hlNative("flight", "flight_zero_velocity")
	public static function zeroVelocity(out:flight._hl.Velocity2D):Void;
	@:hlNative("flight", "flight_get_velocity_sample_at")
	public static function getVelocitySampleAt(sample:flight._hl.VelocitySample, currentWorldTransform:flight._hl.Matrix, pointX:Single, pointY:Single, out:flight._hl.Velocity2D):Void;
	@:hlNative("flight", "flight_create_velocity_field")
	public static function createVelocityField():flight._hl.VelocityField;
	@:hlNative("flight", "flight_begin_velocity_frame")
	public static function beginVelocityFrame(field:flight._hl.VelocityField):Void;
	@:hlNative("flight", "flight_contribute_velocity")
	public static function contributeVelocity(field:flight._hl.VelocityField, source:haxe.Int64, x:Single, y:Single):Void;
	@:hlNative("flight", "flight_explain_velocity")
	public static function explainVelocity(field:flight._hl.VelocityField, source:haxe.Int64):flight._hl.VelocityExplanation;
	@:hlNative("flight", "flight_get_velocity")
	public static function getVelocity(field:flight._hl.VelocityField, source:haxe.Int64, out:flight._hl.Velocity2D):Void;
	@:hlNative("flight", "flight_has_velocity")
	public static function hasVelocity(field:flight._hl.VelocityField, source:haxe.Int64):Bool;
	@:hlNative("flight", "flight_suppress_velocity")
	public static function suppressVelocity(field:flight._hl.VelocityField, source:haxe.Int64):Void;
	@:hlNative("flight", "flight_free_velocity_field")
	public static function freeVelocityField(ptr:flight._hl.VelocityField):Void;
	@:hlNative("flight", "flight_free_velocity_explanation")
	public static function freeVelocityExplanation(ptr:flight._hl.VelocityExplanation):Void;
}

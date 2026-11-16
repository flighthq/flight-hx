package flight._js._fn;

@:jsRequire("@flighthq/velocity")
extern class Velocity {
	@:native("contributeTransformVelocity")
	public static function contributeTransformVelocity(field:flight._js.VelocityField, root:Dynamic):Void;
	@:native("addVelocity")
	public static function addVelocity(out:flight._js.Velocity2D, a:flight._js.Velocity2D, b:flight._js.Velocity2D):Void;
	@:native("clampVelocity")
	public static function clampVelocity(out:flight._js.Velocity2D, velocity:flight._js.Velocity2D, maxLength:Float):Void;
	@:native("copyVelocity")
	public static function copyVelocity(out:flight._js.Velocity2D, source:flight._js.Velocity2D):Void;
	@:native("dampVelocity")
	public static function dampVelocity(out:flight._js.Velocity2D, current:flight._js.Velocity2D, previous:flight._js.Velocity2D, factor:Float):Void;
	@:native("isVelocityZero")
	public static function isVelocityZero(velocity:flight._js.Velocity2D, epsilon:Null<Float>):Bool;
	@:native("lengthOfVelocity")
	public static function lengthOfVelocity(velocity:flight._js.Velocity2D):Float;
	@:native("lerpVelocity")
	public static function lerpVelocity(out:flight._js.Velocity2D, a:flight._js.Velocity2D, b:flight._js.Velocity2D, t:Float):Void;
	@:native("normalizeVelocity")
	public static function normalizeVelocity(out:flight._js.Velocity2D, source:flight._js.Velocity2D):Void;
	@:native("scaleVelocity")
	public static function scaleVelocity(out:flight._js.Velocity2D, velocity:flight._js.Velocity2D, scale:Float):Void;
	@:native("subtractVelocity")
	public static function subtractVelocity(out:flight._js.Velocity2D, a:flight._js.Velocity2D, b:flight._js.Velocity2D):Void;
	@:native("zeroVelocity")
	public static function zeroVelocity(out:flight._js.Velocity2D):Void;
	@:native("getVelocitySampleAt")
	public static function getVelocitySampleAt(sample:flight._js.VelocitySample, currentWorldTransform:flight._js.Matrix, pointX:Float, pointY:Float, out:flight._js.Velocity2D):Void;
	@:native("createVelocityField")
	public static function createVelocityField():flight._js.VelocityField;
	@:native("beginVelocityFrame")
	public static function beginVelocityFrame(field:flight._js.VelocityField):Void;
	@:native("contributeVelocity")
	public static function contributeVelocity(field:flight._js.VelocityField, source:Float, x:Float, y:Float):Void;
	@:native("explainVelocity")
	public static function explainVelocity(field:flight._js.VelocityField, source:Float):flight._js.VelocityExplanation;
	@:native("getVelocity")
	public static function getVelocity(field:flight._js.VelocityField, source:Float, out:flight._js.Velocity2D):Void;
	@:native("hasVelocity")
	public static function hasVelocity(field:flight._js.VelocityField, source:Float):Bool;
	@:native("suppressVelocity")
	public static function suppressVelocity(field:flight._js.VelocityField, source:Float):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeVelocityField(ptr:flight._js.VelocityField):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeVelocityExplanation(ptr:flight._js.VelocityExplanation):Void {}
}

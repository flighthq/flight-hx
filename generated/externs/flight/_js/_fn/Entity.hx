package flight._js._fn;

@:jsRequire("@flighthq/entity")
extern class Entity {
	@:native("disableEntityRuntimeGuards")
	public static function disableEntityRuntimeGuards():Void;
	@:native("enableEntityRuntimeGuards")
	public static function enableEntityRuntimeGuards(report:flight._js.EntityRuntimeWriteGuard):Void;
	@:native("explainEntityRuntimeWrite")
	public static function explainEntityRuntimeWrite(slot:Dynamic):flight._js.EntityRuntimeWriteExplanation;
	@:native("areEntityRuntimeGuardsEnabled")
	public static function areEntityRuntimeGuardsEnabled():Bool;
	@:native("setEntityRuntimeGuardMode")
	public static function setEntityRuntimeGuardMode(enabled:Bool):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeEntityRuntimeWriteExplanation(ptr:flight._js.EntityRuntimeWriteExplanation):Void {}
}

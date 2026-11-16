package flight._cpp._fn;

extern class Entity {
	@:native("flight_disable_entity_runtime_guards")
	public static function disableEntityRuntimeGuards():Void;
	@:native("flight_enable_entity_runtime_guards")
	public static function enableEntityRuntimeGuards(report:flight._cpp.EntityRuntimeWriteGuard):Void;
	@:native("flight_explain_entity_runtime_write")
	public static function explainEntityRuntimeWrite(slot:Int):flight._cpp.EntityRuntimeWriteExplanation;
	@:native("flight_are_entity_runtime_guards_enabled")
	public static function areEntityRuntimeGuardsEnabled():Bool;
	@:native("flight_set_entity_runtime_guard_mode")
	public static function setEntityRuntimeGuardMode(enabled:Bool):Void;
	@:native("flight_free_entity_runtime_write_explanation")
	public static function freeEntityRuntimeWriteExplanation(ptr:flight._cpp.EntityRuntimeWriteExplanation):Void;
	@:native("flight_free_ref")
	public static function freeRef(ptr:cpp.Star<cpp.Void>):Void;
}

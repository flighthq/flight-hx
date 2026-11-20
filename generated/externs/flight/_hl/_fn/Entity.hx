package flight._hl._fn;

extern class Entity {
	@:hlNative("flight", "flight_disable_entity_runtime_guards")
	public static function disableEntityRuntimeGuards():Void;
	@:hlNative("flight", "flight_enable_entity_runtime_guards")
	public static function enableEntityRuntimeGuards(report:flight._hl.EntityRuntimeWriteGuard):Void;
	@:hlNative("flight", "flight_explain_entity_runtime_write")
	public static function explainEntityRuntimeWrite(slot:Int):flight._hl.EntityRuntimeWriteExplanation;
	@:hlNative("flight", "flight_are_entity_runtime_guards_enabled")
	public static function areEntityRuntimeGuardsEnabled():Bool;
	@:hlNative("flight", "flight_set_entity_runtime_guard_mode")
	public static function setEntityRuntimeGuardMode(enabled:Bool):Void;
	@:hlNative("flight", "flight_free_entity_runtime_write_explanation")
	public static function freeEntityRuntimeWriteExplanation(ptr:flight._hl.EntityRuntimeWriteExplanation):Void;
}

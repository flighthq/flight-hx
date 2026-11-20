package flight._hl._fn;

extern class Shortcut {
	@:hlNative("flight", "flight_equals_accelerator")
	public static function equalsAccelerator(a:hl.Bytes, b:hl.Bytes):Bool;
	@:hlNative("flight", "flight_find_accelerator_conflict")
	public static function findAcceleratorConflict(accelerator:hl.Bytes, candidates:hl.Bytes, candidatesLen:Int):hl.Bytes;
	@:hlNative("flight", "flight_format_accelerator_for_display")
	public static function formatAcceleratorForDisplay(accelerator:hl.Bytes, platform:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_accelerator_key")
	public static function getAcceleratorKey(accelerator:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_accelerator_key_label")
	public static function getAcceleratorKeyLabel(key:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_accelerator_modifier_label")
	public static function getAcceleratorModifierLabel(modifier:Int, platform:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_accelerator_modifiers")
	public static function getAcceleratorModifiers(out:hl.Bytes, accelerator:hl.Bytes):Bool;
	@:hlNative("flight", "flight_is_accelerator_valid")
	public static function isAcceleratorValid(input:hl.Bytes):Bool;
	@:hlNative("flight", "flight_make_parsed_accelerator")
	public static function makeParsedAccelerator():flight._hl.ParsedAccelerator;
	@:hlNative("flight", "flight_normalize_accelerator")
	public static function normalizeAccelerator(input:hl.Bytes):flight._hl.Accelerator;
	@:hlNative("flight", "flight_parse_accelerator")
	public static function parseAccelerator(out:flight._hl.ParsedAccelerator, input:hl.Bytes):Bool;
	@:hlNative("flight", "flight_parse_accelerator_detailed")
	public static function parseAcceleratorDetailed(out:flight._hl.ParsedAccelerator, input:hl.Bytes):flight._hl.AcceleratorParseError;
	@:hlNative("flight", "flight_resolve_command_or_control_modifier")
	public static function resolveCommandOrControlModifier(platform:Int):Int;
	@:hlNative("flight", "flight_create_global_shortcut")
	public static function createGlobalShortcut(accelerator:hl.Bytes):flight._hl.CreateGlobalShortcutOutcome;
	@:hlNative("flight", "flight_free_parsed_accelerator")
	public static function freeParsedAccelerator(ptr:flight._hl.ParsedAccelerator):Void;
	@:hlNative("flight", "flight_free_accelerator")
	public static function freeAccelerator(ptr:flight._hl.Accelerator):Void;
	@:hlNative("flight", "flight_free_accelerator_parse_error")
	public static function freeAcceleratorParseError(ptr:flight._hl.AcceleratorParseError):Void;
	@:hlNative("flight", "flight_free_create_global_shortcut_outcome")
	public static function freeCreateGlobalShortcutOutcome(ptr:flight._hl.CreateGlobalShortcutOutcome):Void;
}

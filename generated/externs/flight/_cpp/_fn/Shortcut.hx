package flight._cpp._fn;

extern class Shortcut {
	@:native("flight_equals_accelerator")
	public static function equalsAccelerator(a:cpp.ConstCharStar, b:cpp.ConstCharStar):Bool;
	@:native("flight_find_accelerator_conflict")
	public static function findAcceleratorConflict(accelerator:cpp.ConstCharStar, candidates:cpp.Star<cpp.Void>, candidatesLen:Int):cpp.ConstCharStar;
	@:native("flight_format_accelerator_for_display")
	public static function formatAcceleratorForDisplay(accelerator:cpp.ConstCharStar, platform:Int):cpp.ConstCharStar;
	@:native("flight_get_accelerator_key")
	public static function getAcceleratorKey(accelerator:cpp.ConstCharStar):Int;
	@:native("flight_get_accelerator_key_label")
	public static function getAcceleratorKeyLabel(key:Int):cpp.ConstCharStar;
	@:native("flight_get_accelerator_modifier_label")
	public static function getAcceleratorModifierLabel(modifier:Int, platform:Int):cpp.ConstCharStar;
	@:native("flight_get_accelerator_modifiers")
	public static function getAcceleratorModifiers(out:cpp.Star<cpp.Void>, accelerator:cpp.ConstCharStar):Bool;
	@:native("flight_is_accelerator_valid")
	public static function isAcceleratorValid(input:cpp.ConstCharStar):Bool;
	@:native("flight_make_parsed_accelerator")
	public static function makeParsedAccelerator():flight._cpp.ParsedAccelerator;
	@:native("flight_normalize_accelerator")
	public static function normalizeAccelerator(input:cpp.ConstCharStar):flight._cpp.Accelerator;
	@:native("flight_parse_accelerator")
	public static function parseAccelerator(out:flight._cpp.ParsedAccelerator, input:cpp.ConstCharStar):Bool;
	@:native("flight_parse_accelerator_detailed")
	public static function parseAcceleratorDetailed(out:flight._cpp.ParsedAccelerator, input:cpp.ConstCharStar):flight._cpp.AcceleratorParseError;
	@:native("flight_resolve_command_or_control_modifier")
	public static function resolveCommandOrControlModifier(platform:Int):Int;
	@:native("flight_create_global_shortcut")
	public static function createGlobalShortcut(accelerator:cpp.ConstCharStar):flight._cpp.CreateGlobalShortcutOutcome;
	@:native("flight_free_parsed_accelerator")
	public static function freeParsedAccelerator(ptr:flight._cpp.ParsedAccelerator):Void;
	@:native("flight_free_accelerator")
	public static function freeAccelerator(ptr:flight._cpp.Accelerator):Void;
	@:native("flight_free_accelerator_parse_error")
	public static function freeAcceleratorParseError(ptr:flight._cpp.AcceleratorParseError):Void;
	@:native("flight_free_create_global_shortcut_outcome")
	public static function freeCreateGlobalShortcutOutcome(ptr:flight._cpp.CreateGlobalShortcutOutcome):Void;
}

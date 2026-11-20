package flight._js._fn;

@:jsRequire("@flighthq/shortcut")
extern class Shortcut {
	@:native("equalsAccelerator")
	public static function equalsAccelerator(a:String, b:String):Bool;
	@:native("findAcceleratorConflict")
	public static function findAcceleratorConflict(accelerator:String, candidates:Dynamic):Null<String>;
	@:native("formatAcceleratorForDisplay")
	public static function formatAcceleratorForDisplay(accelerator:String, platform:Dynamic):String;
	@:native("getAcceleratorKey")
	public static function getAcceleratorKey(accelerator:String):Null<Dynamic>;
	@:native("getAcceleratorKeyLabel")
	public static function getAcceleratorKeyLabel(key:Dynamic):String;
	@:native("getAcceleratorModifierLabel")
	public static function getAcceleratorModifierLabel(modifier:Dynamic, platform:Dynamic):String;
	@:native("getAcceleratorModifiers")
	public static function getAcceleratorModifiers(out:Dynamic, accelerator:String):Bool;
	@:native("isAcceleratorValid")
	public static function isAcceleratorValid(input:String):Bool;
	@:native("makeParsedAccelerator")
	public static function makeParsedAccelerator():flight._js.ParsedAccelerator;
	@:native("normalizeAccelerator")
	public static function normalizeAccelerator(input:String):Null<flight._js.Accelerator>;
	@:native("parseAccelerator")
	public static function parseAccelerator(out:flight._js.ParsedAccelerator, input:String):Bool;
	@:native("parseAcceleratorDetailed")
	public static function parseAcceleratorDetailed(out:flight._js.ParsedAccelerator, input:String):Null<flight._js.AcceleratorParseError>;
	@:native("resolveCommandOrControlModifier")
	public static function resolveCommandOrControlModifier(platform:Dynamic):Dynamic;
	@:native("createGlobalShortcut")
	public static function createGlobalShortcut(accelerator:String):flight._js.CreateGlobalShortcutOutcome;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeParsedAccelerator(ptr:flight._js.ParsedAccelerator):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAccelerator(ptr:flight._js.Accelerator):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAcceleratorParseError(ptr:flight._js.AcceleratorParseError):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCreateGlobalShortcutOutcome(ptr:flight._js.CreateGlobalShortcutOutcome):Void {}
}

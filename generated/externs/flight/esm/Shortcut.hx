package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/shortcut")
extern class Shortcut {
  public static function attachGlobalShortcut(hostShortcutTrigger:flight.esm.types.shortcut.Types.HostShortcutTriggerCapability, shortcut:flight.esm.types.shortcut.Types.GlobalShortcut):js.lib.Promise<Dynamic>;
  public static function createGlobalShortcut(accelerator:String):flight.esm.types.shortcut.Types.CreateGlobalShortcutOutcome;
  public static function destroyShortcutTrigger(hostShortcutTrigger:flight.esm.types.shortcut.Types.HostShortcutTriggerCapability):js.lib.Promise<Void>;
  public static function detachGlobalShortcut(hostShortcutTrigger:flight.esm.types.shortcut.Types.HostShortcutTriggerCapability, shortcut:flight.esm.types.shortcut.Types.GlobalShortcut):js.lib.Promise<Dynamic>;
  public static function disposeGlobalShortcut(hostShortcutTrigger:flight.esm.types.shortcut.Types.HostShortcutTriggerCapability, shortcut:flight.esm.types.shortcut.Types.GlobalShortcut):js.lib.Promise<Dynamic>;
  public static function equalsAccelerator(a:String, b:String):Bool;
  public static function findAcceleratorConflict(accelerator:String, candidates:Array<String>):Null<String>;
  public static function formatAcceleratorForDisplay(accelerator:String, platform:String):String;
  public static function getAcceleratorKey(accelerator:String):Null<String>;
  public static function getAcceleratorKeyLabel(key:flight.esm.types.shortcut.Types.ShortcutKeyName):String;
  public static function getAcceleratorModifierLabel(modifier:flight.esm.types.shortcut.Types.ShortcutModifier, platform:String):String;
  public static function getAcceleratorModifiers(accelerator:String, out:Array<flight.esm.types.shortcut.Types.ShortcutModifier>):Null<Array<flight.esm.types.shortcut.Types.ShortcutModifier>>;
  public static function isAcceleratorValid(input:String):Bool;
  public static function makeParsedAccelerator():flight.esm.types.shortcut.Types.ParsedAccelerator;
  public static function normalizeAccelerator(input:String):Null<String>;
  public static function parseAccelerator(input:String, out:flight.esm.types.shortcut.Types.ParsedAccelerator):Null<flight.esm.types.shortcut.Types.ParsedAccelerator>;
  public static function parseAcceleratorDetailed(input:String, out:flight.esm.types.shortcut.Types.ParsedAccelerator):Dynamic;
  public static function queryGlobalShortcutConflict(hostShortcutQuery:flight.esm.types.shortcut.Types.HostShortcutQueryCapability, accelerator:String):js.lib.Promise<flight.esm.types.shortcut.Types.GlobalShortcutQueryOutcome>;
  public static function queryGlobalShortcutRegistration(hostShortcutQuery:flight.esm.types.shortcut.Types.HostShortcutQueryCapability, accelerator:String):js.lib.Promise<flight.esm.types.shortcut.Types.GlobalShortcutQueryOutcome>;
  public static function resolveCommandOrControlModifier(platform:String):String;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

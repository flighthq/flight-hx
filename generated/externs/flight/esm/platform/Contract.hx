package flight.esm.platform;

#if (js && flight_esm)
@:jsRequire("@flighthq/platform/contract")
extern class Contract {
  public static function comparePlatformVersions(a:String, b:String):Float;
  public static function createPlatformInfo():flight.esm.types.platform.Types.PlatformInfo;
  public static function getPlatformEndiannessString(value:flight.esm.types.platform.Types.PlatformEndianness):String;
  public static function getPlatformEngine(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):flight.esm.types.platform.Types.PlatformEngine;
  public static function getPlatformEngineString(value:flight.esm.types.platform.Types.PlatformEngine):String;
  public static function getPlatformInfo(out:flight.esm.types.platform.Types.PlatformInfo, hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):Void;
  public static function getPlatformKind(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):flight.esm.types.platform.Types.PlatformKind;
  public static function getPlatformKindString(value:flight.esm.types.platform.Types.PlatformKind):String;
  public static function getPlatformName(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):flight.esm.types.platform.Types.PlatformName;
  public static function getPlatformNameString(value:flight.esm.types.platform.Types.PlatformName):String;
  public static function getPlatformRuntime(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):flight.esm.types.platform.Types.PlatformRuntime;
  public static function getPlatformRuntimeString(value:flight.esm.types.platform.Types.PlatformRuntime):String;
  public static function initializePlatformInfo(out:flight.esm.types.platform.Types.PlatformInfo):Void;
  public static function isPlatformDesktop(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):Bool;
  public static function isPlatformMobile(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):Bool;
  public static function isPlatformNative(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):Bool;
  public static function isPlatformTouch(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):Bool;
  public static function isPlatformVersionAtLeast(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability, minimum:String):Bool;
  public static function isPlatformWeb(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):Bool;
  public static function parsePlatformEndianness(value:String):Null<String>;
  public static function parsePlatformEngine(value:String):Null<String>;
  public static function parsePlatformKind(value:String):Null<String>;
  public static function parsePlatformName(value:String):Null<String>;
  public static function parsePlatformRuntime(value:String):Null<String>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/platform")
extern class Platform {
  public static function comparePlatformVersions(a:String, b:String):Float;
  public static function createPlatformInfo():flight.esm.types.platform.Types.PlatformInfo;
  public static function getPlatformEngine(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):flight.esm.types.platform.Types.PlatformEngine;
  public static function getPlatformInfo(out:flight.esm.types.platform.Types.PlatformInfo, hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):Void;
  public static function getPlatformKind(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):flight.esm.types.platform.Types.PlatformKind;
  public static function getPlatformName(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):flight.esm.types.platform.Types.PlatformName;
  public static function getPlatformRuntime(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):flight.esm.types.platform.Types.PlatformRuntime;
  public static function isPlatformDesktop(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):Bool;
  public static function isPlatformMobile(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):Bool;
  public static function isPlatformNative(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):Bool;
  public static function isPlatformTouch(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):Bool;
  public static function isPlatformVersionAtLeast(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability, minimum:String):Bool;
  public static function isPlatformWeb(hostPlatform:flight.esm.types.platform.Types.HostPlatformCapability):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

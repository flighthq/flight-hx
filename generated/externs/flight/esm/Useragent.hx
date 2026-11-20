package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/useragent")
extern class Useragent {
  public static final DeviceFormFactorCar:String;
  public static final DeviceFormFactorDesktop:String;
  public static final DeviceFormFactorPhone:String;
  public static final DeviceFormFactorTV:String;
  public static final DeviceFormFactorTablet:String;
  public static final DeviceFormFactorUnknown:String;
  public static final DeviceFormFactorWatch:String;
  public static function detectEndianness():String;
  public static function parseUserAgentArch(ua:String, ?uadPlatform:Null<String>):String;
  public static function parseUserAgentEngine(ua:String):String;
  public static function parseUserAgentEngineVersion(ua:String, engine:String):String;
  public static function parseUserAgentFormFactor(ua:String, maxTouchPoints:Float):String;
  public static function parseUserAgentKind(name:String):String;
  public static function parseUserAgentName(ua:String):String;
  public static function parseUserAgentOsName(ua:String):String;
  public static function parseUserAgentOsVersion(ua:String):String;
  public static function parseUserAgentPointerWidth(arch:String):Float;
  public static function parseUserAgentRuntime(?win:Dynamic):String;
  public static function parseUserAgentVersion(ua:String, name:String):String;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

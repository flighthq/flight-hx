package flight.esm.screen;

#if (js && flight_esm)
@:jsRequire("@flighthq/screen/contract")
extern class Contract {
  public static function attachScreenPermissionChange(hostScreenPermissionChange:flight.esm.types.screen.Types.HostScreenPermissionChangeCapability, permissionChange:flight.esm.types.screen.Types.ScreenPermissionChange):Void;
  public static function attachScreenSignals(hostScreenChange:flight.esm.types.screen.Types.HostScreenChangeCapability, signals:flight.esm.types.screen.Types.ScreenSignals):Void;
  public static function createScreenInfo():flight.esm.types.screen.Types.ScreenInfo;
  public static function createScreenMode():flight.esm.types.screen.Types.ScreenMode;
  public static function createScreenPermissionChange():flight.esm.types.screen.Types.ScreenPermissionChange;
  public static function createScreenSignals():flight.esm.types.screen.Types.ScreenSignals;
  public static function detachScreenPermissionChange(permissionChange:flight.esm.types.screen.Types.ScreenPermissionChange):Void;
  public static function detachScreenSignals(signals:flight.esm.types.screen.Types.ScreenSignals):Void;
  public static function dipToScreenPoint(screen:flight.esm.types.screen.Types.ScreenInfo, point:flight.esm.types.geometry.Types.Vector2Like, out:Dynamic):Void;
  public static function dipToScreenRect(screen:flight.esm.types.screen.Types.ScreenInfo, rect:flight.esm.types.geometry.Types.RectangleLike, out:Dynamic):Void;
  public static function disposeScreenPermissionChange(permissionChange:flight.esm.types.screen.Types.ScreenPermissionChange):Void;
  public static function disposeScreenSignals(signals:flight.esm.types.screen.Types.ScreenSignals):Void;
  public static function getPrimaryScreen(hostScreenQuery:flight.esm.types.screen.Types.HostScreenQueryCapability, out:flight.esm.types.screen.Types.ScreenInfo):Void;
  public static function getScreenBounds(screen:flight.esm.types.screen.Types.ScreenInfo, out:Dynamic):Void;
  public static function getScreenById(hostScreenQuery:flight.esm.types.screen.Types.HostScreenQueryCapability, id:Float, out:flight.esm.types.screen.Types.ScreenInfo):Null<flight.esm.types.screen.Types.ScreenInfo>;
  public static function getScreenContainingRect(hostScreenQuery:flight.esm.types.screen.Types.HostScreenQueryCapability, rect:flight.esm.types.geometry.Types.RectangleLike, out:flight.esm.types.screen.Types.ScreenInfo):Void;
  public static function getScreenCurrentMode(screen:flight.esm.types.screen.Types.ScreenInfo, out:flight.esm.types.screen.Types.ScreenMode):Void;
  public static function getScreenCursorPosition(hostScreenQuery:flight.esm.types.screen.Types.HostScreenQueryCapability, out:Dynamic):Void;
  public static function getScreenCursorScreen(hostScreenQuery:flight.esm.types.screen.Types.HostScreenQueryCapability, out:flight.esm.types.screen.Types.ScreenInfo):Void;
  public static function getScreenDetailPermission(hostScreenDetails:flight.esm.types.screen.Types.HostScreenDetailsCapability):js.lib.Promise<flight.esm.types.screen.Types.ScreenPermissionState>;
  public static function getScreenNearestPoint(hostScreenQuery:flight.esm.types.screen.Types.HostScreenQueryCapability, point:flight.esm.types.geometry.Types.Vector2Like, out:flight.esm.types.screen.Types.ScreenInfo):Void;
  public static function getScreenNearestRect(hostScreenQuery:flight.esm.types.screen.Types.HostScreenQueryCapability, rect:flight.esm.types.geometry.Types.RectangleLike, out:flight.esm.types.screen.Types.ScreenInfo):Void;
  public static function getScreenWorkArea(screen:flight.esm.types.screen.Types.ScreenInfo, out:Dynamic):Void;
  public static function getScreens(hostScreenQuery:flight.esm.types.screen.Types.HostScreenQueryCapability, out:Array<flight.esm.types.screen.Types.ScreenInfo>):Void;
  public static function initializeScreenInfo(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.screen.Types.ScreenInfo>):Void;
  public static function initializeScreenMode(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.screen.Types.ScreenMode>):Void;
  public static function initializeScreenPermissionChange(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.screen.Types.ScreenPermissionChange>):Void;
  public static function initializeScreenSignals(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.screen.Types.ScreenSignals>):Void;
  public static function requestScreenDetails(hostScreenDetails:flight.esm.types.screen.Types.HostScreenDetailsCapability):js.lib.Promise<Bool>;
  public static function screenToDipPoint(screen:flight.esm.types.screen.Types.ScreenInfo, point:flight.esm.types.geometry.Types.Vector2Like, out:Dynamic):Void;
  public static function screenToDipRect(screen:flight.esm.types.screen.Types.ScreenInfo, rect:flight.esm.types.geometry.Types.RectangleLike, out:Dynamic):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

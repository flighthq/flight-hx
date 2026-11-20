package flight.esm.statusbar;

#if (js && flight_esm)
@:jsRequire("@flighthq/statusbar/contract")
extern class Contract {
  public static function attachStatusBar(hostStatusBarChange:flight.esm.types.statusbar.Types.HostStatusBarChangeCapability, hostStatusBarInfo:flight.esm.types.statusbar.Types.HostStatusBarInfoCapability, bar:flight.esm.types.statusbar.Types.StatusBar):Void;
  public static function clearStatusBarStyleStack(hostStatusBarInfo:flight.esm.types.statusbar.Types.HostStatusBarInfoCapability):Void;
  public static function createStatusBar():flight.esm.types.statusbar.Types.StatusBar;
  public static function createStatusBarInfo():flight.esm.types.statusbar.Types.StatusBarInfo;
  public static function detachStatusBar(bar:flight.esm.types.statusbar.Types.StatusBar):Void;
  public static function disposeStatusBar(bar:flight.esm.types.statusbar.Types.StatusBar):Void;
  public static function getStatusBarHeight(hostStatusBarInfo:flight.esm.types.statusbar.Types.HostStatusBarInfoCapability):Float;
  public static function getStatusBarInfo(hostStatusBarInfo:flight.esm.types.statusbar.Types.HostStatusBarInfoCapability, out:flight.esm.types.statusbar.Types.StatusBarInfo):Void;
  public static function hasStatusBarStyleEntry(hostStatusBarInfo:flight.esm.types.statusbar.Types.HostStatusBarInfoCapability, handle:Float):Bool;
  public static function initializeStatusBar(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.statusbar.Types.StatusBar>):Void;
  public static function initializeStatusBarInfo(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.statusbar.Types.StatusBarInfo>):Void;
  public static function packedRgbaToHexColor(color:Float):String;
  public static function popStatusBarStyleEntry(hostStatusBarInfo:flight.esm.types.statusbar.Types.HostStatusBarInfoCapability, handle:Float):Void;
  public static function pushStatusBarStyleEntry(hostStatusBarColor:flight.esm.types.statusbar.Types.HostStatusBarColorCapability, hostStatusBarInfo:flight.esm.types.statusbar.Types.HostStatusBarInfoCapability, hostStatusBarOverlays:flight.esm.types.statusbar.Types.HostStatusBarOverlaysCapability, hostStatusBarStyle:flight.esm.types.statusbar.Types.HostStatusBarStyleCapability, hostStatusBarVisibility:flight.esm.types.statusbar.Types.HostStatusBarVisibilityCapability, entry:flight.esm.types.statusbar.Types.StatusBarStyleEntry):Float;
  public static function setStatusBarColor(hostStatusBarColor:flight.esm.types.statusbar.Types.HostStatusBarColorCapability, color:Float, ?animated:Null<Bool>):Void;
  public static function setStatusBarOverlaysContent(hostStatusBarOverlays:flight.esm.types.statusbar.Types.HostStatusBarOverlaysCapability, overlay:Bool):Void;
  public static function setStatusBarStyle(hostStatusBarStyle:flight.esm.types.statusbar.Types.HostStatusBarStyleCapability, style:flight.esm.types.statusbar.Types.StatusBarStyle):Void;
  public static function setStatusBarVisible(hostStatusBarVisibility:flight.esm.types.statusbar.Types.HostStatusBarVisibilityCapability, visible:Bool, ?animation:Null<String>):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/menu")
extern class Menu {
  public static final WellKnownMenuItemRole:Dynamic;
  public static function attachMenuHighlight(hostMenuHighlight:flight.esm.types.menu.Types.HostMenuHighlightCapability, highlight:flight.esm.types.menu.Types.MenuHighlight):Void;
  public static function attachMenuSelect(hostMenuSelect:flight.esm.types.menu.Types.HostMenuSelectCapability, select:flight.esm.types.menu.Types.MenuSelect):Void;
  public static function cloneMenuTemplate(template:flight.esm.types.menu.Types.MenuItemTemplate):flight.esm.types.menu.Types.MenuItemTemplate;
  public static function createDefaultAppMenuTemplate(appName:String):flight.esm.types.menu.Types.MenuItemTemplate;
  public static function createDefaultEditMenuTemplate():flight.esm.types.menu.Types.MenuItemTemplate;
  public static function createDefaultFileMenuTemplate():flight.esm.types.menu.Types.MenuItemTemplate;
  public static function createDefaultHelpMenuTemplate():flight.esm.types.menu.Types.MenuItemTemplate;
  public static function createDefaultViewMenuTemplate():flight.esm.types.menu.Types.MenuItemTemplate;
  public static function createDefaultWindowMenuTemplate():flight.esm.types.menu.Types.MenuItemTemplate;
  public static function createMenuHighlight():flight.esm.types.menu.Types.MenuHighlight;
  public static function createMenuItemTemplate(?template:Dynamic):flight.esm.types.menu.Types.MenuItemTemplate;
  public static function createMenuSelect():flight.esm.types.menu.Types.MenuSelect;
  public static function destroyAppMenu(...hostAppMenu:flight.esm.types.menu.Types.HostAppMenuCapability):Void;
  public static function detachMenuHighlight(highlight:flight.esm.types.menu.Types.MenuHighlight):Void;
  public static function detachMenuSelect(select:flight.esm.types.menu.Types.MenuSelect):Void;
  public static function disposeMenuHighlight(highlight:flight.esm.types.menu.Types.MenuHighlight):Void;
  public static function disposeMenuSelect(select:flight.esm.types.menu.Types.MenuSelect):Void;
  public static function enableMenuSignals():flight.esm.types.menu.Types.MenuSignals;
  public static function getMenuSignals():Null<flight.esm.types.menu.Types.MenuSignals>;
  public static function setAppMenu(hostAppMenu:flight.esm.types.menu.Types.HostAppMenuCapability, items:Array<flight.esm.types.menu.Types.MenuItemTemplate>):Bool;
  public static function showContextMenu(hostMenuPopup:flight.esm.types.menu.Types.HostMenuPopupCapability, items:Array<flight.esm.types.menu.Types.MenuItemTemplate>, x:Float, y:Float):js.lib.Promise<Null<String>>;
  public static function validateMenuItemTemplate(template:flight.esm.types.menu.Types.MenuItemTemplate):Null<String>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

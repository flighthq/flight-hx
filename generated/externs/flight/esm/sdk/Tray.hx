package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/tray")
extern class Tray {
  public static function createTrayIcon(hostTrayLifecycle:flight.esm.types.tray.Types.HostTrayLifecycleCapability, ?options:flight.esm.types.tray.Types.TrayIconOptions):js.lib.Promise<flight.esm.types.tray.Types.TrayCreateResult<Dynamic>>;
  public static function destroyTrayIcon(tray:flight.esm.types.tray.Types.TrayIcon):js.lib.Promise<flight.esm.types.tray.Types.TrayDestroyResult>;
  public static function disableTrayGuards():Void;
  public static function displayTrayBalloon(hostTrayBalloon:flight.esm.types.tray.Types.HostTrayBalloonCapability, tray:flight.esm.types.tray.Types.TrayIcon, options:flight.esm.types.tray.Types.TrayBalloonOptions):js.lib.Promise<flight.esm.types.tray.Types.TrayBalloonDisplayResult>;
  public static function enableTrayGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function getTrayIconBounds(hostTrayBounds:flight.esm.types.tray.Types.HostTrayBoundsCapability, tray:flight.esm.types.tray.Types.TrayIcon):js.lib.Promise<flight.esm.types.tray.Types.TrayBoundsResult>;
  public static function getTrayIconTitle(hostTrayTitle:flight.esm.types.tray.Types.HostTrayTitleCapability, tray:flight.esm.types.tray.Types.TrayIcon):js.lib.Promise<flight.esm.types.tray.Types.TrayTitleReadResult>;
  public static function getTrayIconTooltip(hostTrayTooltip:flight.esm.types.tray.Types.HostTrayTooltipCapability, tray:flight.esm.types.tray.Types.TrayIcon):js.lib.Promise<flight.esm.types.tray.Types.TrayTooltipReadResult>;
  public static function getTrayIcons(hostTrayLifecycle:flight.esm.types.tray.Types.HostTrayLifecycleCapability):Array<flight.esm.types.tray.Types.TrayIcon>;
  public static function isTrayDestroyed(tray:flight.esm.types.tray.Types.TrayIcon):Bool;
  public static function isTrayIconAnimating(tray:flight.esm.types.tray.Types.TrayIcon):Bool;
  public static function onTrayBalloonEvent(hostTrayBalloonEvents:flight.esm.types.tray.Types.HostTrayBalloonEventsCapability, tray:flight.esm.types.tray.Types.TrayIcon, listener:((event:flight.esm.types.tray.Types.TrayBalloonEvent) -> Void)):flight.esm.types.tray.Types.TrayEventAttachResult;
  public static function onTrayDrop(hostTrayDropEvents:flight.esm.types.tray.Types.HostTrayDropEventsCapability, tray:flight.esm.types.tray.Types.TrayIcon, listener:((event:flight.esm.types.tray.Types.TrayDropEvent) -> Void)):flight.esm.types.tray.Types.TrayEventAttachResult;
  public static function onTrayInteraction(hostTrayInteractionEvents:flight.esm.types.tray.Types.HostTrayInteractionEventsCapability, tray:flight.esm.types.tray.Types.TrayIcon, listener:((event:flight.esm.types.tray.Types.TrayInteractionEvent) -> Void)):flight.esm.types.tray.Types.TrayEventAttachResult;
  public static function onTrayMenuSelection(hostTrayMenuSelectionEvents:flight.esm.types.tray.Types.HostTrayMenuSelectionEventsCapability, tray:flight.esm.types.tray.Types.TrayIcon, listener:((event:flight.esm.types.tray.Types.TrayMenuSelectionEvent) -> Void)):flight.esm.types.tray.Types.TrayEventAttachResult;
  public static function popupTrayContextMenu(hostTrayPopupMenu:flight.esm.types.tray.Types.HostTrayPopupMenuCapability, tray:flight.esm.types.tray.Types.TrayIcon, ?position:Null<flight.esm.types.geometry.Types.Vector2Like>):js.lib.Promise<flight.esm.types.tray.Types.TrayPopupMenuResult>;
  public static function removeTrayBalloon(hostTrayBalloon:flight.esm.types.tray.Types.HostTrayBalloonCapability, tray:flight.esm.types.tray.Types.TrayIcon):js.lib.Promise<flight.esm.types.tray.Types.TrayBalloonRemoveResult>;
  public static function setTrayIcon(hostTrayImage:flight.esm.types.tray.Types.HostTrayImageCapability, tray:flight.esm.types.tray.Types.TrayIcon, icon:String):js.lib.Promise<flight.esm.types.tray.Types.TrayImageUpdateResult>;
  public static function setTrayIconContextMenu(hostTrayMenu:flight.esm.types.tray.Types.HostTrayMenuCapability, tray:flight.esm.types.tray.Types.TrayIcon, items:Array<flight.esm.types.menu.Types.MenuItemTemplate>):js.lib.Promise<flight.esm.types.tray.Types.TrayMenuUpdateResult>;
  public static function setTrayIconTemplate(hostTrayTemplateImage:flight.esm.types.tray.Types.HostTrayTemplateImageCapability, tray:flight.esm.types.tray.Types.TrayIcon, isTemplate:Bool):js.lib.Promise<flight.esm.types.tray.Types.TrayTemplateImageUpdateResult>;
  public static function setTrayIconTitle(hostTrayTitle:flight.esm.types.tray.Types.HostTrayTitleCapability, tray:flight.esm.types.tray.Types.TrayIcon, title:String):js.lib.Promise<flight.esm.types.tray.Types.TrayTitleUpdateResult>;
  public static function setTrayIconTooltip(hostTrayTooltip:flight.esm.types.tray.Types.HostTrayTooltipCapability, tray:flight.esm.types.tray.Types.TrayIcon, tooltip:String):js.lib.Promise<flight.esm.types.tray.Types.TrayTooltipUpdateResult>;
  public static function setTrayIgnoreDoubleClickEvents(hostTrayDoubleClickPolicy:flight.esm.types.tray.Types.HostTrayDoubleClickPolicyCapability, tray:flight.esm.types.tray.Types.TrayIcon, ignore:Bool):js.lib.Promise<flight.esm.types.tray.Types.TrayDoubleClickPolicyUpdateResult>;
  public static function setTrayPressedIcon(hostTrayPressedImage:flight.esm.types.tray.Types.HostTrayPressedImageCapability, tray:flight.esm.types.tray.Types.TrayIcon, icon:String):js.lib.Promise<flight.esm.types.tray.Types.TrayPressedImageUpdateResult>;
  public static function startTrayIconAnimation(hostTrayImage:flight.esm.types.tray.Types.HostTrayImageCapability, tray:flight.esm.types.tray.Types.TrayIcon, frames:Array<String>, intervalMs:Float):js.lib.Promise<flight.esm.types.tray.Types.TrayAnimationStartResult>;
  public static function stopTrayIconAnimation(tray:flight.esm.types.tray.Types.TrayIcon):flight.esm.types.tray.Types.TrayAnimationStopResult;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

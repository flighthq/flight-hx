package flight.esm.types.tray;

#if (js && flight_esm)
typedef DesktopOsProfile = String;

typedef HostTrayBalloonCapability = { display:((tray:flight.esm.types.tray.Types.TrayIcon, options:flight.esm.types.tray.Types.TrayBalloonOptions) -> js.lib.Promise<flight.esm.types.tray.Types.TrayBalloonDisplayResult>), remove:((tray:flight.esm.types.tray.Types.TrayIcon) -> js.lib.Promise<flight.esm.types.tray.Types.TrayBalloonRemoveResult>) };

typedef HostTrayBalloonEventsCapability = { getSignal:((tray:flight.esm.types.tray.Types.TrayIcon) -> Null<flight.esm.types.signals.Types.Signal<Dynamic>>) };

typedef HostTrayBoundsCapability = { get:((tray:flight.esm.types.tray.Types.TrayIcon) -> js.lib.Promise<flight.esm.types.tray.Types.TrayBoundsResult>) };

typedef HostTrayCapabilities = { ?balloon:Null<flight.esm.types.tray.Types.HostTrayBalloonCapability>, ?balloonEvents:Null<flight.esm.types.tray.Types.HostTrayBalloonEventsCapability>, ?bounds:Null<flight.esm.types.tray.Types.HostTrayBoundsCapability>, ?doubleClickPolicy:Null<flight.esm.types.tray.Types.HostTrayDoubleClickPolicyCapability>, ?dropEvents:Null<flight.esm.types.tray.Types.HostTrayDropEventsCapability>, ?image:Null<flight.esm.types.tray.Types.HostTrayImageCapability>, ?interactionEvents:Null<flight.esm.types.tray.Types.HostTrayInteractionEventsCapability>, ?lifecycle:Null<flight.esm.types.tray.Types.HostTrayLifecycleCapability>, ?menu:Null<flight.esm.types.tray.Types.HostTrayMenuCapability>, ?menuSelectionEvents:Null<flight.esm.types.tray.Types.HostTrayMenuSelectionEventsCapability>, ?popupMenu:Null<flight.esm.types.tray.Types.HostTrayPopupMenuCapability>, ?pressedImage:Null<flight.esm.types.tray.Types.HostTrayPressedImageCapability>, ?templateImage:Null<flight.esm.types.tray.Types.HostTrayTemplateImageCapability>, ?title:Null<flight.esm.types.tray.Types.HostTrayTitleCapability>, ?tooltip:Null<flight.esm.types.tray.Types.HostTrayTooltipCapability> };

typedef HostTrayDoubleClickPolicyCapability = { setIgnore:((tray:flight.esm.types.tray.Types.TrayIcon, ignore:Bool) -> js.lib.Promise<flight.esm.types.tray.Types.TrayDoubleClickPolicyUpdateResult>) };

typedef HostTrayDropEventsCapability = { getSignal:((tray:flight.esm.types.tray.Types.TrayIcon) -> Null<flight.esm.types.signals.Types.Signal<Dynamic>>) };

typedef HostTrayImageCapability = { set:((tray:flight.esm.types.tray.Types.TrayIcon, icon:String) -> js.lib.Promise<flight.esm.types.tray.Types.TrayImageUpdateResult>) };

typedef HostTrayInteractionEventsCapability = { getSignal:((tray:flight.esm.types.tray.Types.TrayIcon) -> Null<flight.esm.types.signals.Types.Signal<Dynamic>>) };

typedef HostTrayLifecycleCapability = { create:((tray:flight.esm.types.tray.Types.TrayIcon, options:flight.esm.types.tray.Types.TrayIconOptions) -> js.lib.Promise<flight.esm.types.tray.Types.TrayCreateCapabilityResult>), destroy:((tray:flight.esm.types.tray.Types.TrayIcon) -> js.lib.Promise<flight.esm.types.tray.Types.TrayDestroyCapabilityResult>), isDestroyed:((tray:flight.esm.types.tray.Types.TrayIcon) -> Bool), list:(() -> Array<flight.esm.types.tray.Types.TrayIcon>) };

typedef HostTrayMenuCapability = { set:((tray:flight.esm.types.tray.Types.TrayIcon, items:Array<flight.esm.types.menu.Types.MenuItemTemplate>) -> js.lib.Promise<flight.esm.types.tray.Types.TrayMenuUpdateResult>) };

typedef HostTrayMenuSelectionEventsCapability = { getSignal:((tray:flight.esm.types.tray.Types.TrayIcon) -> Null<flight.esm.types.signals.Types.Signal<Dynamic>>) };

typedef HostTrayPopupMenuCapability = { popup:((tray:flight.esm.types.tray.Types.TrayIcon, ?position:Null<flight.esm.types.geometry.Types.Vector2Like>) -> js.lib.Promise<flight.esm.types.tray.Types.TrayPopupMenuResult>) };

typedef HostTrayPressedImageCapability = { set:((tray:flight.esm.types.tray.Types.TrayIcon, icon:String) -> js.lib.Promise<flight.esm.types.tray.Types.TrayPressedImageUpdateResult>) };

typedef HostTrayTemplateImageCapability = { set:((tray:flight.esm.types.tray.Types.TrayIcon, isTemplate:Bool) -> js.lib.Promise<flight.esm.types.tray.Types.TrayTemplateImageUpdateResult>) };

typedef HostTrayTitleCapability = { get:((tray:flight.esm.types.tray.Types.TrayIcon) -> js.lib.Promise<flight.esm.types.tray.Types.TrayTitleReadResult>), set:((tray:flight.esm.types.tray.Types.TrayIcon, title:String) -> js.lib.Promise<flight.esm.types.tray.Types.TrayTitleUpdateResult>) };

typedef HostTrayTooltipCapability = { get:((tray:flight.esm.types.tray.Types.TrayIcon) -> js.lib.Promise<flight.esm.types.tray.Types.TrayTooltipReadResult>), set:((tray:flight.esm.types.tray.Types.TrayIcon, tooltip:String) -> js.lib.Promise<flight.esm.types.tray.Types.TrayTooltipUpdateResult>) };

typedef TrayAnimationStartResult = Dynamic;

typedef TrayAnimationStopResult = Dynamic;

typedef TrayBalloonDisplayResult = Dynamic;

typedef TrayBalloonEvent = { type:String };

typedef TrayBalloonOptions = { ?icon:Null<String>, ?iconType:Null<String>, ?largeIcon:Null<Bool>, ?noSound:Null<Bool>, ?respectQuietTime:Null<Bool>, text:String, title:String };

typedef TrayBalloonRemoveResult = Dynamic;

typedef TrayBoundsResult = Dynamic;

typedef TrayCreateCapabilityResult = Dynamic;

typedef TrayCreateResult<Tray> = Dynamic;

typedef TrayDestroyCapabilityResult = Dynamic;

typedef TrayDestroyFailure = { ?error:Dynamic, step:String };

typedef TrayDestroyResult = Dynamic;

typedef TrayDoubleClickPolicyUpdateResult = Dynamic;

typedef TrayDropEvent = Dynamic;

typedef TrayEventAttachResult = Dynamic;

typedef TrayEventRelease = { release:(() -> js.lib.Promise<flight.esm.types.tray.Types.TrayReleaseResult>) };

typedef TrayIcon = Dynamic;

typedef TrayIconOptions = { ?icon:Null<String>, ?iconTemplate:Null<Bool>, ?signal:Null<js.html.AbortSignal>, ?title:Null<String>, ?tooltip:Null<String> };

typedef TrayIconSource = String;

typedef TrayImageUpdateResult = Dynamic;

typedef TrayInteractionEvent = { altKey:Bool, bounds:Null<flight.esm.types.geometry.Types.RectangleLike>, ctrlKey:Bool, metaKey:Bool, position:Null<flight.esm.types.geometry.Types.Vector2Like>, shiftKey:Bool, type:String };

typedef TrayMenuSelectionEvent = { id:String };

typedef TrayMenuUpdateResult = Dynamic;

typedef TrayPopupMenuResult = Dynamic;

typedef TrayPressedImageUpdateResult = Dynamic;

typedef TrayReleaseResult = Dynamic;

typedef TrayTemplateImageUpdateResult = Dynamic;

typedef TrayTitleReadResult = Dynamic;

typedef TrayTitleUpdateResult = Dynamic;

typedef TrayTooltipReadResult = Dynamic;

typedef TrayTooltipUpdateResult = Dynamic;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

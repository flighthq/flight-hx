package flight.esm.types.menu;

#if (js && flight_esm)
typedef ElectronMenuCapabilities = { app:flight.esm.types.menu.Types.HostAppMenuCapability, popup:flight.esm.types.menu.Types.HostMenuPopupCapability, select:flight.esm.types.menu.Types.HostMenuSelectCapability };

typedef HostAppMenuCapability = { ?destroy:Null<(() -> Void)>, setAppMenu:((items:Array<flight.esm.types.menu.Types.MenuItemTemplate>) -> Bool) };

typedef HostMenuCapabilities = { ?app:Null<flight.esm.types.menu.Types.HostAppMenuCapability>, ?highlight:Null<flight.esm.types.menu.Types.HostMenuHighlightCapability>, ?popup:Null<flight.esm.types.menu.Types.HostMenuPopupCapability>, ?select:Null<flight.esm.types.menu.Types.HostMenuSelectCapability> };

typedef HostMenuHighlightCapability = { subscribe:((listener:Dynamic) -> Dynamic) };

typedef HostMenuPopupCapability = { popup:((items:Array<flight.esm.types.menu.Types.MenuItemTemplate>, x:Float, y:Float) -> js.lib.Promise<Null<String>>) };

typedef HostMenuSelectCapability = { subscribe:((listener:Dynamic) -> Dynamic) };

typedef MenuHighlight = { onMenuItemHighlight:flight.esm.types.signals.Types.Signal<String> };

typedef MenuItemRole = Dynamic;

typedef MenuItemTemplate = { ?id:Null<String>, ?label:Null<String>, ?type:Null<String>, ?role:Dynamic, ?accelerator:Null<String>, ?enabled:Null<Bool>, ?checked:Null<Bool>, ?visible:Null<Bool>, ?sublabel:Null<String>, ?toolTip:Null<String>, ?submenu:Null<Array<flight.esm.types.menu.Types.MenuItemTemplate>> };

typedef MenuItemType = String;

typedef MenuSelect = { onMenuItemSelect:flight.esm.types.signals.Types.Signal<String> };

typedef MenuSignals = { onContextMenuClose:flight.esm.types.signals.Types.Signal<Void>, onContextMenuOpen:flight.esm.types.signals.Types.Signal<Void> };

typedef TauriMenuCapabilities = { app:flight.esm.types.menu.Types.HostAppMenuCapability, popup:flight.esm.types.menu.Types.HostMenuPopupCapability, select:flight.esm.types.menu.Types.HostMenuSelectCapability };

typedef WellKnownMenuItemRoleValue = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

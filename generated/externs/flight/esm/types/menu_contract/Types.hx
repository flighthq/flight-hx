package flight.esm.types.menu_contract;

#if (js && flight_esm)
typedef ElectronMenuCapabilities = flight.esm.types.menu.Types.ElectronMenuCapabilities;

typedef HostAppMenuCapability = flight.esm.types.menu.Types.HostAppMenuCapability;

typedef HostMenuCapabilities = flight.esm.types.menu.Types.HostMenuCapabilities;

typedef HostMenuHighlightCapability = flight.esm.types.menu.Types.HostMenuHighlightCapability;

typedef HostMenuPopupCapability = flight.esm.types.menu.Types.HostMenuPopupCapability;

typedef HostMenuSelectCapability = flight.esm.types.menu.Types.HostMenuSelectCapability;

typedef MenuHighlight = flight.esm.types.menu.Types.MenuHighlight;

typedef MenuItemRole = flight.esm.types.menu.Types.MenuItemRole;

typedef MenuItemTemplate = flight.esm.types.menu.Types.MenuItemTemplate;

typedef MenuItemType = flight.esm.types.menu.Types.MenuItemType;

typedef MenuSelect = flight.esm.types.menu.Types.MenuSelect;

typedef MenuSignals = flight.esm.types.menu.Types.MenuSignals;

typedef TauriMenuCapabilities = flight.esm.types.menu.Types.TauriMenuCapabilities;

typedef WellKnownMenuItemRoleValue = flight.esm.types.menu.Types.WellKnownMenuItemRoleValue;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

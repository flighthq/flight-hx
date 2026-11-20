package flight.esm.types.permissions_contract;

#if (js && flight_esm)
typedef HostPermissionsCapability = { notification:flight.esm.types.notification_contract.Types.HostNotificationPermissionCapability, queryPermission:((name:flight.esm.types.permissions_contract.Types.PermissionName) -> js.lib.Promise<flight.esm.types.permissions_contract.Types.PermissionQueryOutcome>), requestMediaAccess:((name:String) -> js.lib.Promise<flight.esm.types.permissions_contract.Types.PermissionRequestOutcome>), requestWakeLock:(() -> js.lib.Promise<flight.esm.types.permissions_contract.Types.PermissionRequestOutcome>) };

typedef PermissionName = Dynamic;

typedef PermissionQueryFailureReason = String;

typedef PermissionQueryOutcome = Dynamic;

typedef PermissionRequestFailureReason = String;

typedef PermissionRequestOutcome = Dynamic;

typedef PermissionState = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

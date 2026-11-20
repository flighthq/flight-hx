package flight.esm.types.updater_contract;

#if (js && flight_esm)
typedef AppUpdateCheckOutcome = Dynamic;

typedef AppUpdateInstallOutcome = { reason:String };

typedef DownloadedUpdate = { info:flight.esm.types.updater_contract.Types.UpdateInfo };

typedef HostUpdaterCommandCapability = { check:(() -> js.lib.Promise<flight.esm.types.updater_contract.Types.AppUpdateCheckOutcome>), destroy:(() -> Void), install:((update:flight.esm.types.updater_contract.Types.DownloadedUpdate) -> js.lib.Promise<flight.esm.types.updater_contract.Types.AppUpdateInstallOutcome>) };

typedef UpdateInfo = { downloadSizeBytes:Null<Float>, isMandatory:Null<Bool>, minimumOsVersion:Null<String>, notes:Null<String>, releaseDate:Null<String>, sha512:Null<String>, version:Null<String> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/updater")
extern class Updater {
  public static function checkForAppUpdate(hostUpdaterCommand:flight.esm.types.updater_contract.Types.HostUpdaterCommandCapability):js.lib.Promise<flight.esm.types.updater_contract.Types.AppUpdateCheckOutcome>;
  public static function destroyUpdater(hostUpdaterCommand:flight.esm.types.updater_contract.Types.HostUpdaterCommandCapability):Void;
  public static function installDownloadedUpdate(hostUpdaterCommand:flight.esm.types.updater_contract.Types.HostUpdaterCommandCapability, update:flight.esm.types.updater_contract.Types.DownloadedUpdate):js.lib.Promise<flight.esm.types.updater_contract.Types.AppUpdateInstallOutcome>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

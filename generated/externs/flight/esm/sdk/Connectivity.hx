package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/connectivity")
extern class Connectivity {
  public static function attachConnectivity(hostConnectivityStatus:flight.esm.types.connectivity_contract.Types.HostConnectivityStatusCapability, hostConnectivityChange:flight.esm.types.connectivity_contract.Types.HostConnectivityChangeCapability, connectivity:flight.esm.types.connectivity_contract.Types.Connectivity):Bool;
  public static function createConnectivity():flight.esm.types.connectivity_contract.Types.Connectivity;
  public static function destroyConnectivity(hostConnectivityChange:flight.esm.types.connectivity_contract.Types.HostConnectivityChangeCapability):Void;
  public static function detachConnectivity(connectivity:flight.esm.types.connectivity_contract.Types.Connectivity):Void;
  public static function detectConnectivityReachability(hostConnectivityReachability:flight.esm.types.connectivity_contract.Types.HostConnectivityReachabilityCapability, options:flight.esm.types.connectivity_contract.Types.ConnectivityReachabilityOptions, out:flight.esm.types.connectivity_contract.Types.ConnectivityReachability):js.lib.Promise<flight.esm.types.connectivity_contract.Types.ConnectivityReachability>;
  public static function disposeConnectivity(connectivity:flight.esm.types.connectivity_contract.Types.Connectivity):Void;
  public static function getConnectivityOnline(hostConnectivityStatus:flight.esm.types.connectivity_contract.Types.HostConnectivityStatusCapability):Null<Bool>;
  public static function getConnectivityStatus(hostConnectivityStatus:flight.esm.types.connectivity_contract.Types.HostConnectivityStatusCapability, out:flight.esm.types.connectivity_contract.Types.ConnectivityStatus):Void;
  public static function hasConnectivityStatusChanged(a:flight.esm.types.connectivity_contract.Types.ConnectivityStatus, b:flight.esm.types.connectivity_contract.Types.ConnectivityStatus):Bool;
  public static function isConnectivityMetered(hostConnectivityStatus:flight.esm.types.connectivity_contract.Types.HostConnectivityStatusCapability):Bool;
  public static function isConnectivitySaveDataEnabled(hostConnectivityStatus:flight.esm.types.connectivity_contract.Types.HostConnectivityStatusCapability):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

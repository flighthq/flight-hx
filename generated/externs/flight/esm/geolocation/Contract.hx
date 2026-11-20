package flight.esm.geolocation;

#if (js && flight_esm)
@:jsRequire("@flighthq/geolocation/contract")
extern class Contract {
  public static function clearGeolocationWatch(hostGeolocation:flight.esm.types.geolocation_contract.Types.HostGeolocationCapability, id:Float):Void;
  public static function createGeolocationPosition():flight.esm.types.geolocation_contract.Types.GeolocationPosition;
  public static function getCurrentGeolocationPosition(hostGeolocation:flight.esm.types.geolocation_contract.Types.HostGeolocationCapability, ?options:Null<flight.esm.types.geolocation_contract.Types.GeolocationRequestOptions>):js.lib.Promise<Null<flight.esm.types.geolocation_contract.Types.GeolocationPosition>>;
  public static function getCurrentGeolocationPositionResult(hostGeolocation:flight.esm.types.geolocation_contract.Types.HostGeolocationCapability, ?options:Null<flight.esm.types.geolocation_contract.Types.GeolocationRequestOptions>):js.lib.Promise<flight.esm.types.geolocation_contract.Types.GeolocationPositionResult>;
  public static function initializeGeolocationPosition(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.geolocation_contract.Types.GeolocationPosition>):Void;
  public static function isGeolocationAvailable(hostGeolocation:flight.esm.types.geolocation_contract.Types.HostGeolocationCapability):Bool;
  public static function promptForGeolocationAccess(hostGeolocation:Null<flight.esm.types.geolocation_contract.Types.HostGeolocationCapability>):js.lib.Promise<flight.esm.types.geolocation_contract.Types.GeolocationAccessOutcome>;
  public static function watchGeolocationPosition(hostGeolocation:flight.esm.types.geolocation_contract.Types.HostGeolocationCapability, handler:((position:flight.esm.types.geolocation_contract.Types.GeolocationPosition) -> Void), ?options:Null<flight.esm.types.geolocation_contract.Types.GeolocationRequestOptions>, ?onError:Null<((reason:flight.esm.types.geolocation_contract.Types.GeolocationErrorReason) -> Void)>):Float;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

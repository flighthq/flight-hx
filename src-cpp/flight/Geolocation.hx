// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function clearGeolocationWatch(hostGeolocation:flight.HostGeolocationCapability, id:Float):Void {
  flight._cpp._attempt.Attempt_Geolocation_clearGeolocationWatch.clearGeolocationWatch(hostGeolocation, id);
}

extern inline function createGeolocationPosition():flight.GeolocationPosition {
  return flight._cpp._attempt.Attempt_Geolocation_createGeolocationPosition.createGeolocationPosition();
}

extern inline function getCurrentGeolocationPosition(hostGeolocation:flight.HostGeolocationCapability, ?options:flight.GeolocationRequestOptions):flight._internal._Promise<Null<flight.GeolocationPosition>> {
  return flight._cpp._attempt.Attempt_Geolocation_getCurrentGeolocationPosition.getCurrentGeolocationPosition(hostGeolocation, options);
}

extern inline function getCurrentGeolocationPositionResult(hostGeolocation:flight.HostGeolocationCapability, ?options:flight.GeolocationRequestOptions):flight._internal._Promise<flight.GeolocationPositionResult> {
  return flight._cpp._attempt.Attempt_Geolocation_getCurrentGeolocationPositionResult.getCurrentGeolocationPositionResult(hostGeolocation, options);
}

extern inline function initializeGeolocationPosition(out:flight.EntityConstruction<flight.GeolocationPosition>):Void {
  flight._cpp._attempt.Attempt_Geolocation_initializeGeolocationPosition.initializeGeolocationPosition(out);
}

extern inline function isGeolocationAvailable(hostGeolocation:flight.HostGeolocationCapability):Bool {
  return flight._cpp._attempt.Attempt_Geolocation_isGeolocationAvailable.isGeolocationAvailable(hostGeolocation);
}

extern inline function promptForGeolocationAccess(hostGeolocation:Null<flight.HostGeolocationCapability>):flight._internal._Promise<flight.GeolocationAccessOutcome> {
  return flight._cpp._attempt.Attempt_Geolocation_promptForGeolocationAccess.promptForGeolocationAccess(hostGeolocation);
}

extern inline function watchGeolocationPosition(hostGeolocation:flight.HostGeolocationCapability, handler:(flight.GeolocationPosition)->Void, ?options:flight.GeolocationRequestOptions, ?onError:(flight.GeolocationErrorReason)->Void):Float {
  return flight._cpp._attempt.Attempt_Geolocation_watchGeolocationPosition.watchGeolocationPosition(hostGeolocation, handler, options, onError);
}

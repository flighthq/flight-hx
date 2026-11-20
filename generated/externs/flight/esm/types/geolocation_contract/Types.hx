package flight.esm.types.geolocation_contract;

#if (js && flight_esm)
typedef GeolocationAccessOutcome = { reason:String };

typedef GeolocationErrorReason = String;

typedef GeolocationPosition = { latitude:Float, longitude:Float, accuracy:Float, altitude:Float, altitudeAccuracy:Float, floorLevel:Float, heading:Float, speed:Float, timestamp:Float };

typedef GeolocationPositionResult = { position:Null<flight.esm.types.geolocation_contract.Types.GeolocationPosition>, reason:Null<String> };

typedef GeolocationRequestOptions = { ?enableHighAccuracy:Null<Bool>, ?timeoutMs:Null<Float>, ?maximumAgeMs:Null<Float> };

typedef HostGeolocationCapability = { getCurrentPosition:((options:flight.esm.types.geolocation_contract.Types.GeolocationRequestOptions) -> js.lib.Promise<Null<flight.esm.types.geolocation_contract.Types.GeolocationPosition>>), getCurrentPositionResult:((options:flight.esm.types.geolocation_contract.Types.GeolocationRequestOptions) -> js.lib.Promise<flight.esm.types.geolocation_contract.Types.GeolocationPositionResult>), isAvailable:(() -> Bool), watchPosition:((listener:Dynamic, options:flight.esm.types.geolocation_contract.Types.GeolocationRequestOptions, ?onError:Dynamic) -> Float), clearWatch:((id:Float) -> Void), promptForAccess:(() -> js.lib.Promise<flight.esm.types.geolocation_contract.Types.GeolocationAccessOutcome>) };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

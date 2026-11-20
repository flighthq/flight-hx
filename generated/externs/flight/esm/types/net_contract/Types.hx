package flight.esm.types.net_contract;

#if (js && flight_esm)
typedef HostNetCapabilities = flight.esm.types.net.Types.HostNetCapabilities;

typedef HostNetCapability = flight.esm.types.net.Types.HostNetCapability;

typedef NetBody = flight.esm.types.net.Types.NetBody;

typedef NetCredentials = flight.esm.types.net.Types.NetCredentials;

typedef NetGuard = flight.esm.types.net.Types.NetGuard;

typedef NetGuardNotice = flight.esm.types.net.Types.NetGuardNotice;

typedef NetMethod = flight.esm.types.net.Types.NetMethod;

typedef NetProgress = flight.esm.types.net.Types.NetProgress;

typedef NetRedirect = flight.esm.types.net.Types.NetRedirect;

typedef NetRequest = flight.esm.types.net.Types.NetRequest;

typedef NetRequestOptions = flight.esm.types.net.Types.NetRequestOptions;

typedef NetResponse = flight.esm.types.net.Types.NetResponse;

typedef NetResponseBody = flight.esm.types.net.Types.NetResponseBody;

typedef NetResponseExplanation = flight.esm.types.net.Types.NetResponseExplanation;

typedef NetResponseType = flight.esm.types.net.Types.NetResponseType;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

package flight.esm.types.sdk_host;

#if (js && flight_esm)
typedef BackendExplanation = flight.esm.types.host.Types.BackendExplanation;

typedef BackendExplanationLayer = flight.esm.types.host.Types.BackendExplanationLayer;

typedef BackendExplanationViability = flight.esm.types.host.Types.BackendExplanationViability;

typedef BackendOperationExplanation = flight.esm.types.host.Types.BackendOperationExplanation;

typedef BackendOperationExplanationLayer = flight.esm.types.host.Types.BackendOperationExplanationLayer;

typedef HostCapabilityBackend = flight.esm.types.host.Types.HostCapabilityBackend;

typedef HostCapabilityCoverage = flight.esm.types.host.Types.HostCapabilityCoverage;

typedef HostCapabilityExplanation = flight.esm.types.host.Types.HostCapabilityExplanation;

typedef HostCapabilityGroupExplanation = flight.esm.types.host.Types.HostCapabilityGroupExplanation;

typedef HostExplanation = flight.esm.types.host.Types.HostExplanation;

typedef InputIngressSource = flight.esm.types.host.Types.InputIngressSource;

typedef ProviderRef = flight.esm.types.host.Types.ProviderRef;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

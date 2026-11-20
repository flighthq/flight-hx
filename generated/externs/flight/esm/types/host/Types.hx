package flight.esm.types.host;

#if (js && flight_esm)
typedef BackendExplanation = { conflict:Bool, layer:flight.esm.types.host.Types.BackendExplanationLayer, operation:Null<String>, viability:flight.esm.types.host.Types.BackendExplanationViability };

typedef BackendExplanationLayer = String;

typedef BackendExplanationViability = String;

typedef BackendOperationExplanation = { implemented:Bool, layer:flight.esm.types.host.Types.BackendOperationExplanationLayer, operation:String };

typedef BackendOperationExplanationLayer = String;

typedef HostCapabilityBackend = { entryPoint:String, packageName:String, platform:String };

typedef HostCapabilityCoverage = { capability:String, group:String, isPresent:Bool, slot:String };

typedef HostCapabilityExplanation = { backends:Array<flight.esm.types.host.Types.HostCapabilityBackend>, capability:String, group:String, isPresent:Bool, message:String, slot:String };

typedef HostCapabilityGroupExplanation = { group:String, slots:Array<String> };

typedef HostExplanation = { capabilities:Array<flight.esm.types.host.Types.HostCapabilityCoverage>, groups:Array<flight.esm.types.host.Types.HostCapabilityGroupExplanation> };

typedef InputIngressSource = { provider:Dynamic, handle:Dynamic };

typedef ProviderRef = Dynamic;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

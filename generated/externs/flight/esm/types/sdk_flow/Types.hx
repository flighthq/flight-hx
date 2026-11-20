package flight.esm.types.sdk_flow;

#if (js && flight_esm)
typedef FlowGuardContext = flight.esm.types.flow.Types.FlowGuardContext;

typedef FlowGuardKind = flight.esm.types.flow.Types.FlowGuardKind;

typedef FlowGuardState = flight.esm.types.flow.Types.FlowGuardState;

typedef FlowStack = flight.esm.types.flow.Types.FlowStack;

typedef FlowStackRaw = flight.esm.types.flow.Types.FlowStackRaw;

typedef FlowState = flight.esm.types.flow.Types.FlowState;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

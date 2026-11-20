package flight.esm.types.debug_contract;

#if (js && flight_esm)
typedef DebugOptions = flight.esm.types.debug.Types.DebugOptions;

typedef DebugState = flight.esm.types.debug.Types.DebugState;

typedef DebugSubsystemHooks = flight.esm.types.debug.Types.DebugSubsystemHooks;

typedef DebugSubsystemName = flight.esm.types.debug.Types.DebugSubsystemName;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end

package flight;

#if hl

typedef DebugSubsystemHooks = flight._hl.DebugSubsystemHooks;

#elseif cpp

typedef DebugSubsystemHooks = flight._cpp.DebugSubsystemHooks;

#elseif (js && flight_esm)

typedef DebugSubsystemHooks = flight._js.DebugSubsystemHooks;

#elseif js

#error "flight.DebugSubsystemHooks on js requires flight_esm."

#else

#error "flight.DebugSubsystemHooks: no backend for this target."

#end

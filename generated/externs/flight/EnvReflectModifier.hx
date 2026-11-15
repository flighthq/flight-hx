package flight;

#if hl

typedef EnvReflectModifier = flight._hl.EnvReflectModifier;

#elseif cpp

typedef EnvReflectModifier = flight._cpp.EnvReflectModifier;

#elseif (js && flight_esm)

typedef EnvReflectModifier = flight._js.EnvReflectModifier;

#elseif js

#error "flight.EnvReflectModifier on js requires flight_esm."

#else

#error "flight.EnvReflectModifier: no backend for this target."

#end

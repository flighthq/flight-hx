package flight;

#if hl

typedef InputGamepadAxisData = flight._hl.InputGamepadAxisData;

#elseif cpp

typedef InputGamepadAxisData = flight._cpp.InputGamepadAxisData;

#elseif (js && flight_esm)

typedef InputGamepadAxisData = flight._js.InputGamepadAxisData;

#elseif js

#error "flight.InputGamepadAxisData on js requires flight_esm."

#else

#error "flight.InputGamepadAxisData: no backend for this target."

#end

package flight;

#if hl

typedef InputGamepadButtonData = flight._hl.InputGamepadButtonData;

#elseif cpp

typedef InputGamepadButtonData = flight._cpp.InputGamepadButtonData;

#elseif (js && flight_esm)

typedef InputGamepadButtonData = flight._js.InputGamepadButtonData;

#elseif js

#error "flight.InputGamepadButtonData on js requires flight_esm."

#else

#error "flight.InputGamepadButtonData: no backend for this target."

#end

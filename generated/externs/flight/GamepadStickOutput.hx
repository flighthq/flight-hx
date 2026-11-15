package flight;

#if hl

typedef GamepadStickOutput = flight._hl.GamepadStickOutput;

#elseif cpp

typedef GamepadStickOutput = flight._cpp.GamepadStickOutput;

#elseif (js && flight_esm)

typedef GamepadStickOutput = flight._js.GamepadStickOutput;

#elseif js

#error "flight.GamepadStickOutput on js requires flight_esm."

#else

#error "flight.GamepadStickOutput: no backend for this target."

#end

package flight;

#if hl

typedef SpritesheetFormatKind = flight._hl.SpritesheetFormatKind;

#elseif cpp

typedef SpritesheetFormatKind = flight._cpp.SpritesheetFormatKind;

#elseif (js && flight_esm)

typedef SpritesheetFormatKind = flight._js.SpritesheetFormatKind;

#elseif js

#error "flight.SpritesheetFormatKind on js requires flight_esm."

#else

#error "flight.SpritesheetFormatKind: no backend for this target."

#end

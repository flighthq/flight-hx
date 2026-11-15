package flight;

#if hl

typedef SpritesheetFormatRegistry = flight._hl.SpritesheetFormatRegistry;

#elseif cpp

typedef SpritesheetFormatRegistry = flight._cpp.SpritesheetFormatRegistry;

#elseif (js && flight_esm)

typedef SpritesheetFormatRegistry = flight._js.SpritesheetFormatRegistry;

#elseif js

#error "flight.SpritesheetFormatRegistry on js requires flight_esm."

#else

#error "flight.SpritesheetFormatRegistry: no backend for this target."

#end

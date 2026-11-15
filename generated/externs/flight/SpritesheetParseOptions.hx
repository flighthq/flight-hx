package flight;

#if hl

typedef SpritesheetParseOptions = flight._hl.SpritesheetParseOptions;

#elseif cpp

typedef SpritesheetParseOptions = flight._cpp.SpritesheetParseOptions;

#elseif (js && flight_esm)

typedef SpritesheetParseOptions = flight._js.SpritesheetParseOptions;

#elseif js

#error "flight.SpritesheetParseOptions on js requires flight_esm."

#else

#error "flight.SpritesheetParseOptions: no backend for this target."

#end

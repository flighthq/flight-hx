package flight;

#if hl

typedef SpritesheetData = flight._hl.SpritesheetData;

#elseif cpp

typedef SpritesheetData = flight._cpp.SpritesheetData;

#elseif (js && flight_esm)

typedef SpritesheetData = flight._js.SpritesheetData;

#elseif js

#error "flight.SpritesheetData on js requires flight_esm."

#else

#error "flight.SpritesheetData: no backend for this target."

#end

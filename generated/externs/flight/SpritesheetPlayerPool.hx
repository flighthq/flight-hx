package flight;

#if hl

typedef SpritesheetPlayerPool = flight._hl.SpritesheetPlayerPool;

#elseif cpp

typedef SpritesheetPlayerPool = flight._cpp.SpritesheetPlayerPool;

#elseif (js && flight_esm)

typedef SpritesheetPlayerPool = flight._js.SpritesheetPlayerPool;

#elseif js

#error "flight.SpritesheetPlayerPool on js requires flight_esm."

#else

#error "flight.SpritesheetPlayerPool: no backend for this target."

#end

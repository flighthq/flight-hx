package flight;

#if hl

typedef SpritesheetFrame = flight._hl.SpritesheetFrame;

#elseif cpp

typedef SpritesheetFrame = flight._cpp.SpritesheetFrame;

#elseif (js && flight_esm)

typedef SpritesheetFrame = flight._js.SpritesheetFrame;

#elseif js

#error "flight.SpritesheetFrame on js requires flight_esm."

#else

#error "flight.SpritesheetFrame: no backend for this target."

#end

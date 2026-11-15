package flight;

#if hl

typedef SpritesheetFramePattern = flight._hl.SpritesheetFramePattern;

#elseif cpp

typedef SpritesheetFramePattern = flight._cpp.SpritesheetFramePattern;

#elseif (js && flight_esm)

typedef SpritesheetFramePattern = flight._js.SpritesheetFramePattern;

#elseif js

#error "flight.SpritesheetFramePattern on js requires flight_esm."

#else

#error "flight.SpritesheetFramePattern: no backend for this target."

#end

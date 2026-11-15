package flight;

#if hl

typedef SpritesheetFrameData = flight._hl.SpritesheetFrameData;

#elseif cpp

typedef SpritesheetFrameData = flight._cpp.SpritesheetFrameData;

#elseif (js && flight_esm)

typedef SpritesheetFrameData = flight._js.SpritesheetFrameData;

#elseif js

#error "flight.SpritesheetFrameData on js requires flight_esm."

#else

#error "flight.SpritesheetFrameData: no backend for this target."

#end

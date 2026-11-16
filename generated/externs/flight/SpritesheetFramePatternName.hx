package flight;

#if hl

typedef SpritesheetFramePatternName = flight._hl.SpritesheetFramePatternName;

#elseif cpp

typedef SpritesheetFramePatternName = flight._cpp.SpritesheetFramePatternName;

#elseif (js && flight_esm)

typedef SpritesheetFramePatternName = flight._js.SpritesheetFramePatternName;

#elseif js

#error "flight.SpritesheetFramePatternName on js requires flight_esm."

#else

#error "flight.SpritesheetFramePatternName: no backend for this target."

#end

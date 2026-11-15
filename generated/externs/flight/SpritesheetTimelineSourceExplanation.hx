package flight;

#if hl

typedef SpritesheetTimelineSourceExplanation = flight._hl.SpritesheetTimelineSourceExplanation;

#elseif cpp

typedef SpritesheetTimelineSourceExplanation = flight._cpp.SpritesheetTimelineSourceExplanation;

#elseif (js && flight_esm)

typedef SpritesheetTimelineSourceExplanation = flight._js.SpritesheetTimelineSourceExplanation;

#elseif js

#error "flight.SpritesheetTimelineSourceExplanation on js requires flight_esm."

#else

#error "flight.SpritesheetTimelineSourceExplanation: no backend for this target."

#end

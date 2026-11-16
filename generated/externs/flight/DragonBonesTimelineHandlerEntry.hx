package flight;

#if hl

typedef DragonBonesTimelineHandlerEntry = flight._hl.DragonBonesTimelineHandlerEntry;

#elseif cpp

typedef DragonBonesTimelineHandlerEntry = flight._cpp.DragonBonesTimelineHandlerEntry;

#elseif (js && flight_esm)

typedef DragonBonesTimelineHandlerEntry = flight._js.DragonBonesTimelineHandlerEntry;

#elseif js

#error "flight.DragonBonesTimelineHandlerEntry on js requires flight_esm."

#else

#error "flight.DragonBonesTimelineHandlerEntry: no backend for this target."

#end

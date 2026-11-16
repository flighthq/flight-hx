package flight;

#if hl

typedef DragonBonesSectionHandlerEntry = flight._hl.DragonBonesSectionHandlerEntry;

#elseif cpp

typedef DragonBonesSectionHandlerEntry = flight._cpp.DragonBonesSectionHandlerEntry;

#elseif (js && flight_esm)

typedef DragonBonesSectionHandlerEntry = flight._js.DragonBonesSectionHandlerEntry;

#elseif js

#error "flight.DragonBonesSectionHandlerEntry on js requires flight_esm."

#else

#error "flight.DragonBonesSectionHandlerEntry: no backend for this target."

#end

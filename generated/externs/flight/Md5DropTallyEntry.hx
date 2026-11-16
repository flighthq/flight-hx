package flight;

#if hl

typedef Md5DropTallyEntry = flight._hl.Md5DropTallyEntry;

#elseif cpp

typedef Md5DropTallyEntry = flight._cpp.Md5DropTallyEntry;

#elseif (js && flight_esm)

typedef Md5DropTallyEntry = flight._js.Md5DropTallyEntry;

#elseif js

#error "flight.Md5DropTallyEntry on js requires flight_esm."

#else

#error "flight.Md5DropTallyEntry: no backend for this target."

#end

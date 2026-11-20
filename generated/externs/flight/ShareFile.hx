package flight;

#if hl

typedef ShareFile = flight._hl.ShareFile;

#elseif cpp

typedef ShareFile = flight._cpp.ShareFile;

#elseif (js && flight_esm)

typedef ShareFile = flight._js.ShareFile;

#elseif js

#error "flight.ShareFile on js requires flight_esm."

#else

#error "flight.ShareFile: no backend for this target."

#end

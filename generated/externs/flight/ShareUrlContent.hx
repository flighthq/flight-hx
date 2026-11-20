package flight;

#if hl

typedef ShareUrlContent = flight._hl.ShareUrlContent;

#elseif cpp

typedef ShareUrlContent = flight._cpp.ShareUrlContent;

#elseif (js && flight_esm)

typedef ShareUrlContent = flight._js.ShareUrlContent;

#elseif js

#error "flight.ShareUrlContent on js requires flight_esm."

#else

#error "flight.ShareUrlContent: no backend for this target."

#end

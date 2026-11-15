package flight;

#if hl

typedef CocosPlistMetadata = flight._hl.CocosPlistMetadata;

#elseif cpp

typedef CocosPlistMetadata = flight._cpp.CocosPlistMetadata;

#elseif (js && flight_esm)

typedef CocosPlistMetadata = flight._js.CocosPlistMetadata;

#elseif js

#error "flight.CocosPlistMetadata on js requires flight_esm."

#else

#error "flight.CocosPlistMetadata: no backend for this target."

#end

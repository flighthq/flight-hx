package flight;

#if hl

typedef CocosPlistDocument = flight._hl.CocosPlistDocument;

#elseif cpp

typedef CocosPlistDocument = flight._cpp.CocosPlistDocument;

#elseif (js && flight_esm)

typedef CocosPlistDocument = flight._js.CocosPlistDocument;

#elseif js

#error "flight.CocosPlistDocument on js requires flight_esm."

#else

#error "flight.CocosPlistDocument: no backend for this target."

#end

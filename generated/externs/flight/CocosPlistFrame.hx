package flight;

#if hl

typedef CocosPlistFrame = flight._hl.CocosPlistFrame;

#elseif cpp

typedef CocosPlistFrame = flight._cpp.CocosPlistFrame;

#elseif (js && flight_esm)

typedef CocosPlistFrame = flight._js.CocosPlistFrame;

#elseif js

#error "flight.CocosPlistFrame on js requires flight_esm."

#else

#error "flight.CocosPlistFrame: no backend for this target."

#end

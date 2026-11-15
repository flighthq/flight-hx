package flight;

#if hl

typedef AsepriteDocument = flight._hl.AsepriteDocument;

#elseif cpp

typedef AsepriteDocument = flight._cpp.AsepriteDocument;

#elseif (js && flight_esm)

typedef AsepriteDocument = flight._js.AsepriteDocument;

#elseif js

#error "flight.AsepriteDocument on js requires flight_esm."

#else

#error "flight.AsepriteDocument: no backend for this target."

#end

package flight;

#if hl

typedef LottieMaskHandler = flight._hl.LottieMaskHandler;

#elseif cpp

typedef LottieMaskHandler = flight._cpp.LottieMaskHandler;

#elseif (js && flight_esm)

typedef LottieMaskHandler = flight._js.LottieMaskHandler;

#elseif js

#error "flight.LottieMaskHandler on js requires flight_esm."

#else

#error "flight.LottieMaskHandler: no backend for this target."

#end

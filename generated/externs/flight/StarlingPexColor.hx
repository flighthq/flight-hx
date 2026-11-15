package flight;

#if hl

typedef StarlingPexColor = flight._hl.StarlingPexColor;

#elseif cpp

typedef StarlingPexColor = flight._cpp.StarlingPexColor;

#elseif (js && flight_esm)

typedef StarlingPexColor = flight._js.StarlingPexColor;

#elseif js

#error "flight.StarlingPexColor on js requires flight_esm."

#else

#error "flight.StarlingPexColor: no backend for this target."

#end

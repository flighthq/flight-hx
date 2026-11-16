package flight;

#if hl

typedef Awd2ParsedLightPicker = flight._hl.Awd2ParsedLightPicker;

#elseif cpp

typedef Awd2ParsedLightPicker = flight._cpp.Awd2ParsedLightPicker;

#elseif (js && flight_esm)

typedef Awd2ParsedLightPicker = flight._js.Awd2ParsedLightPicker;

#elseif js

#error "flight.Awd2ParsedLightPicker on js requires flight_esm."

#else

#error "flight.Awd2ParsedLightPicker: no backend for this target."

#end

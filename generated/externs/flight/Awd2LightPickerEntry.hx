package flight;

#if hl

typedef Awd2LightPickerEntry = flight._hl.Awd2LightPickerEntry;

#elseif cpp

typedef Awd2LightPickerEntry = flight._cpp.Awd2LightPickerEntry;

#elseif (js && flight_esm)

typedef Awd2LightPickerEntry = flight._js.Awd2LightPickerEntry;

#elseif js

#error "flight.Awd2LightPickerEntry on js requires flight_esm."

#else

#error "flight.Awd2LightPickerEntry: no backend for this target."

#end

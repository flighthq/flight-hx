package flight;

#if hl

typedef HasAppearanceOptions = flight._hl.HasAppearanceOptions;

#elseif cpp

typedef HasAppearanceOptions = flight._cpp.HasAppearanceOptions;

#elseif (js && flight_esm)

typedef HasAppearanceOptions = flight._js.HasAppearanceOptions;

#elseif js

#error "flight.HasAppearanceOptions on js requires flight_esm."

#else

#error "flight.HasAppearanceOptions: no backend for this target."

#end

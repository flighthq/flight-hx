package flight;

#if hl

typedef HasAppearanceRuntime = flight._hl.HasAppearanceRuntime;

#elseif cpp

typedef HasAppearanceRuntime = flight._cpp.HasAppearanceRuntime;

#elseif (js && flight_esm)

typedef HasAppearanceRuntime = flight._js.HasAppearanceRuntime;

#elseif js

#error "flight.HasAppearanceRuntime on js requires flight_esm."

#else

#error "flight.HasAppearanceRuntime: no backend for this target."

#end

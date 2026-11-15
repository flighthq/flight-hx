package flight;

#if hl

typedef PathBooleanOptions = flight._hl.PathBooleanOptions;

#elseif cpp

typedef PathBooleanOptions = flight._cpp.PathBooleanOptions;

#elseif (js && flight_esm)

typedef PathBooleanOptions = flight._js.PathBooleanOptions;

#elseif js

#error "flight.PathBooleanOptions on js requires flight_esm."

#else

#error "flight.PathBooleanOptions: no backend for this target."

#end

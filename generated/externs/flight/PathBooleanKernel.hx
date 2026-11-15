package flight;

#if hl

typedef PathBooleanKernel = flight._hl.PathBooleanKernel;

#elseif cpp

typedef PathBooleanKernel = flight._cpp.PathBooleanKernel;

#elseif (js && flight_esm)

typedef PathBooleanKernel = flight._js.PathBooleanKernel;

#elseif js

#error "flight.PathBooleanKernel on js requires flight_esm."

#else

#error "flight.PathBooleanKernel: no backend for this target."

#end

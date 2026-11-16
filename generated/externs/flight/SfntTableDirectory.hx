package flight;

#if hl

typedef SfntTableDirectory = flight._hl.SfntTableDirectory;

#elseif cpp

typedef SfntTableDirectory = flight._cpp.SfntTableDirectory;

#elseif (js && flight_esm)

typedef SfntTableDirectory = flight._js.SfntTableDirectory;

#elseif js

#error "flight.SfntTableDirectory on js requires flight_esm."

#else

#error "flight.SfntTableDirectory: no backend for this target."

#end

package flight;

#if hl

typedef Woff2TableDirectory = flight._hl.Woff2TableDirectory;

#elseif cpp

typedef Woff2TableDirectory = flight._cpp.Woff2TableDirectory;

#elseif (js && flight_esm)

typedef Woff2TableDirectory = flight._js.Woff2TableDirectory;

#elseif js

#error "flight.Woff2TableDirectory on js requires flight_esm."

#else

#error "flight.Woff2TableDirectory: no backend for this target."

#end

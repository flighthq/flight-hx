package flight;

#if hl

typedef Md5Weight = flight._hl.Md5Weight;

#elseif cpp

typedef Md5Weight = flight._cpp.Md5Weight;

#elseif (js && flight_esm)

typedef Md5Weight = flight._js.Md5Weight;

#elseif js

#error "flight.Md5Weight on js requires flight_esm."

#else

#error "flight.Md5Weight: no backend for this target."

#end

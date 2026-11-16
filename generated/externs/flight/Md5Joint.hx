package flight;

#if hl

typedef Md5Joint = flight._hl.Md5Joint;

#elseif cpp

typedef Md5Joint = flight._cpp.Md5Joint;

#elseif (js && flight_esm)

typedef Md5Joint = flight._js.Md5Joint;

#elseif js

#error "flight.Md5Joint on js requires flight_esm."

#else

#error "flight.Md5Joint: no backend for this target."

#end

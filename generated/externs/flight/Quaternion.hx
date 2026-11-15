package flight;

#if hl

typedef Quaternion = flight._hl.Quaternion;

#elseif cpp

typedef Quaternion = flight._cpp.Quaternion;

#elseif (js && flight_esm)

typedef Quaternion = flight._js.Quaternion;

#elseif js

#error "flight.Quaternion on js requires flight_esm."

#else

#error "flight.Quaternion: no backend for this target."

#end

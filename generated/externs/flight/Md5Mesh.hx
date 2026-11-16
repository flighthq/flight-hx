package flight;

#if hl

typedef Md5Mesh = flight._hl.Md5Mesh;

#elseif cpp

typedef Md5Mesh = flight._cpp.Md5Mesh;

#elseif (js && flight_esm)

typedef Md5Mesh = flight._js.Md5Mesh;

#elseif js

#error "flight.Md5Mesh on js requires flight_esm."

#else

#error "flight.Md5Mesh: no backend for this target."

#end

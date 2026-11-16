package flight;

#if hl

typedef Md5Vertex = flight._hl.Md5Vertex;

#elseif cpp

typedef Md5Vertex = flight._cpp.Md5Vertex;

#elseif (js && flight_esm)

typedef Md5Vertex = flight._js.Md5Vertex;

#elseif js

#error "flight.Md5Vertex on js requires flight_esm."

#else

#error "flight.Md5Vertex: no backend for this target."

#end

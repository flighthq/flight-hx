package flight;

#if hl

typedef CubeTexture = flight._hl.CubeTexture;

#elseif cpp

typedef CubeTexture = flight._cpp.CubeTexture;

#elseif (js && flight_esm)

typedef CubeTexture = flight._js.CubeTexture;

#elseif js

#error "flight.CubeTexture on js requires flight_esm."

#else

#error "flight.CubeTexture: no backend for this target."

#end

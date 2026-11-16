package flight;

#if hl

typedef ColladaDecodedMorph = flight._hl.ColladaDecodedMorph;

#elseif cpp

typedef ColladaDecodedMorph = flight._cpp.ColladaDecodedMorph;

#elseif (js && flight_esm)

typedef ColladaDecodedMorph = flight._js.ColladaDecodedMorph;

#elseif js

#error "flight.ColladaDecodedMorph on js requires flight_esm."

#else

#error "flight.ColladaDecodedMorph: no backend for this target."

#end

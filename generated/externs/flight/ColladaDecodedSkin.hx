package flight;

#if hl

typedef ColladaDecodedSkin = flight._hl.ColladaDecodedSkin;

#elseif cpp

typedef ColladaDecodedSkin = flight._cpp.ColladaDecodedSkin;

#elseif (js && flight_esm)

typedef ColladaDecodedSkin = flight._js.ColladaDecodedSkin;

#elseif js

#error "flight.ColladaDecodedSkin on js requires flight_esm."

#else

#error "flight.ColladaDecodedSkin: no backend for this target."

#end

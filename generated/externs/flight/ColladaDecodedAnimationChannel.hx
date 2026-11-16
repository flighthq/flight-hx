package flight;

#if hl

typedef ColladaDecodedAnimationChannel = flight._hl.ColladaDecodedAnimationChannel;

#elseif cpp

typedef ColladaDecodedAnimationChannel = flight._cpp.ColladaDecodedAnimationChannel;

#elseif (js && flight_esm)

typedef ColladaDecodedAnimationChannel = flight._js.ColladaDecodedAnimationChannel;

#elseif js

#error "flight.ColladaDecodedAnimationChannel on js requires flight_esm."

#else

#error "flight.ColladaDecodedAnimationChannel: no backend for this target."

#end

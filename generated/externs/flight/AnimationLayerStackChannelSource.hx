package flight;

#if hl

typedef AnimationLayerStackChannelSource = flight._hl.AnimationLayerStackChannelSource;

#elseif cpp

typedef AnimationLayerStackChannelSource = flight._cpp.AnimationLayerStackChannelSource;

#elseif (js && flight_esm)

typedef AnimationLayerStackChannelSource = flight._js.AnimationLayerStackChannelSource;

#elseif js

#error "flight.AnimationLayerStackChannelSource on js requires flight_esm."

#else

#error "flight.AnimationLayerStackChannelSource: no backend for this target."

#end

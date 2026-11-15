package flight;

#if hl

typedef AnimationBlendTreeChannelSource = flight._hl.AnimationBlendTreeChannelSource;

#elseif cpp

typedef AnimationBlendTreeChannelSource = flight._cpp.AnimationBlendTreeChannelSource;

#elseif (js && flight_esm)

typedef AnimationBlendTreeChannelSource = flight._js.AnimationBlendTreeChannelSource;

#elseif js

#error "flight.AnimationBlendTreeChannelSource on js requires flight_esm."

#else

#error "flight.AnimationBlendTreeChannelSource: no backend for this target."

#end

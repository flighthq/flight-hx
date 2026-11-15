package flight;

#if hl

typedef ChannelMixerAdjustment = flight._hl.ChannelMixerAdjustment;

#elseif cpp

typedef ChannelMixerAdjustment = flight._cpp.ChannelMixerAdjustment;

#elseif (js && flight_esm)

typedef ChannelMixerAdjustment = flight._js.ChannelMixerAdjustment;

#elseif js

#error "flight.ChannelMixerAdjustment on js requires flight_esm."

#else

#error "flight.ChannelMixerAdjustment: no backend for this target."

#end

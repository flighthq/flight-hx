package flight;

#if hl

typedef ChannelMixerAdjustmentOptions = flight._hl.ChannelMixerAdjustmentOptions;

#elseif cpp

typedef ChannelMixerAdjustmentOptions = flight._cpp.ChannelMixerAdjustmentOptions;

#elseif (js && flight_esm)

typedef ChannelMixerAdjustmentOptions = flight._js.ChannelMixerAdjustmentOptions;

#elseif js

#error "flight.ChannelMixerAdjustmentOptions on js requires flight_esm."

#else

#error "flight.ChannelMixerAdjustmentOptions: no backend for this target."

#end

package flight;

#if hl

typedef HueSaturationAdjustmentOptions = flight._hl.HueSaturationAdjustmentOptions;

#elseif cpp

typedef HueSaturationAdjustmentOptions = flight._cpp.HueSaturationAdjustmentOptions;

#elseif (js && flight_esm)

typedef HueSaturationAdjustmentOptions = flight._js.HueSaturationAdjustmentOptions;

#elseif js

#error "flight.HueSaturationAdjustmentOptions on js requires flight_esm."

#else

#error "flight.HueSaturationAdjustmentOptions: no backend for this target."

#end

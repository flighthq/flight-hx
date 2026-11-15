package flight;

#if hl

typedef BrightnessContrastAdjustmentOptions = flight._hl.BrightnessContrastAdjustmentOptions;

#elseif cpp

typedef BrightnessContrastAdjustmentOptions = flight._cpp.BrightnessContrastAdjustmentOptions;

#elseif (js && flight_esm)

typedef BrightnessContrastAdjustmentOptions = flight._js.BrightnessContrastAdjustmentOptions;

#elseif js

#error "flight.BrightnessContrastAdjustmentOptions on js requires flight_esm."

#else

#error "flight.BrightnessContrastAdjustmentOptions: no backend for this target."

#end

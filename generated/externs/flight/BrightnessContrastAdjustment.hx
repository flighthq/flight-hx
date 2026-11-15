package flight;

#if hl

typedef BrightnessContrastAdjustment = flight._hl.BrightnessContrastAdjustment;

#elseif cpp

typedef BrightnessContrastAdjustment = flight._cpp.BrightnessContrastAdjustment;

#elseif (js && flight_esm)

typedef BrightnessContrastAdjustment = flight._js.BrightnessContrastAdjustment;

#elseif js

#error "flight.BrightnessContrastAdjustment on js requires flight_esm."

#else

#error "flight.BrightnessContrastAdjustment: no backend for this target."

#end

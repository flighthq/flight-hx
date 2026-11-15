package flight;

#if hl

typedef ColorGradeAdjustmentOptions = flight._hl.ColorGradeAdjustmentOptions;

#elseif cpp

typedef ColorGradeAdjustmentOptions = flight._cpp.ColorGradeAdjustmentOptions;

#elseif (js && flight_esm)

typedef ColorGradeAdjustmentOptions = flight._js.ColorGradeAdjustmentOptions;

#elseif js

#error "flight.ColorGradeAdjustmentOptions on js requires flight_esm."

#else

#error "flight.ColorGradeAdjustmentOptions: no backend for this target."

#end

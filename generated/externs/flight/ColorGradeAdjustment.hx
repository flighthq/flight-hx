package flight;

#if hl

typedef ColorGradeAdjustment = flight._hl.ColorGradeAdjustment;

#elseif cpp

typedef ColorGradeAdjustment = flight._cpp.ColorGradeAdjustment;

#elseif (js && flight_esm)

typedef ColorGradeAdjustment = flight._js.ColorGradeAdjustment;

#elseif js

#error "flight.ColorGradeAdjustment on js requires flight_esm."

#else

#error "flight.ColorGradeAdjustment: no backend for this target."

#end

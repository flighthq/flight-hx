package flight;

#if hl

typedef LookupTableGradeAdjustmentOptions = flight._hl.LookupTableGradeAdjustmentOptions;

#elseif cpp

typedef LookupTableGradeAdjustmentOptions = flight._cpp.LookupTableGradeAdjustmentOptions;

#elseif (js && flight_esm)

typedef LookupTableGradeAdjustmentOptions = flight._js.LookupTableGradeAdjustmentOptions;

#elseif js

#error "flight.LookupTableGradeAdjustmentOptions on js requires flight_esm."

#else

#error "flight.LookupTableGradeAdjustmentOptions: no backend for this target."

#end

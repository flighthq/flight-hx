package flight;

#if hl

typedef LookupTableGradeAdjustment = flight._hl.LookupTableGradeAdjustment;

#elseif cpp

typedef LookupTableGradeAdjustment = flight._cpp.LookupTableGradeAdjustment;

#elseif (js && flight_esm)

typedef LookupTableGradeAdjustment = flight._js.LookupTableGradeAdjustment;

#elseif js

#error "flight.LookupTableGradeAdjustment on js requires flight_esm."

#else

#error "flight.LookupTableGradeAdjustment: no backend for this target."

#end
